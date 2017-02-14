module Room.Update exposing (..)

import Window exposing (Size)
import Navigation exposing (Location)
import Room.Model exposing (..)
import Touch exposing (..)
import SingleTouch exposing (SingleTouch, onSingleTouch)


type Msg
    = SizeChange Size
    | UrlChange Location
    | SetActiveWall Wall
    | SingleTouchMsg SingleTouch


initialModel : Room
initialModel =
    { active = Out
    , size = Size 600 600
    , walls = [ Center, Top, Right, Bottom, Left ]
    , message = ""
    , singleTouch = Nothing
    }


update : Msg -> Room -> ( Room, Cmd Msg )
update msg room =
    case msg of
        UrlChange location ->
            let
                activeWall =
                    getWallFromLocation location
            in
                ( { room | active = activeWall }, Cmd.none )

        SizeChange size_ ->
            ( { room | size = size_ }, Cmd.none )

        SetActiveWall wall ->
            ( { room | active = wall }, Cmd.none )

        SingleTouchMsg singleTouch ->
            let
                ( updatedRoom, cmds ) =
                    case singleTouch.touchType of
                        TouchStart ->
                            ( { room
                                | message = "start x, y are " ++ toString singleTouch.touch
                                , singleTouch = Just singleTouch
                              }
                            , Cmd.none
                            )

                        TouchEnd ->
                            let
                                roomTouch =
                                    getXYFromMaybeTouch room.singleTouch

                                newTouch =
                                    ( singleTouch.touch.clientX, singleTouch.touch.clientY )

                                diff =
                                    ( (Tuple.first newTouch) - (Tuple.first roomTouch)
                                    , (Tuple.second newTouch) - (Tuple.second roomTouch)
                                    )
                            in
                                if diff == (0,0) && room.active /= Out then
                                    update (SetActiveWall Out) room 
                                else if Tuple.first diff < -10 then 
                                    update (SetActiveWall Left) room 
                                else if Tuple.first diff > 10 then 
                                    update (SetActiveWall Right) room 
                                else if Tuple.second diff < -10 then 
                                    update (SetActiveWall Top) room 
                                else if Tuple.second diff > 10 then 
                                    update (SetActiveWall Top) room 
                                else 
                                    room ! []

                        _ ->
                            room ! []
            in
                ( updatedRoom, cmds )


getXYFromMaybeTouch : Maybe SingleTouch -> (Float, Float)
getXYFromMaybeTouch st =
    case st of
        Just val ->
            let
                ( x, y ) =
                    ( val.touch.clientX, val.touch.clientY )
            in
                ( x, y )

        Nothing ->
            ( 0, 0 )


getWallFromLocation : Location -> Wall
getWallFromLocation location =
    case String.toLower location.hash of
        "#back" ->
            Out

        "#center" ->
            Center

        "#top" ->
            Top

        "#right" ->
            Right

        "#bottom" ->
            Bottom

        "#left" ->
            Left

        _ ->
            Out
