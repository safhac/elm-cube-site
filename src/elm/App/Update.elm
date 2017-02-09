module App.Update exposing (..)

import Navigation exposing (Location, newUrl)
import Task exposing (perform)
import Window exposing (Size)
import App.Model exposing (Model)
import Room.Model exposing (..)
import Room.Update exposing (initialModel, Msg)
import Char exposing (fromCode)


-- MSG

type Msg
    = RoomMsg Room.Update.Msg
    -- UrlChange Navigation.Location
    -- SizeChange Room.Update.Msg Size
    -- | SetActiveWall Room.Update.Msg Wall



--INIT

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { current = location
      , room = Room.Update.initialModel
      }
    , Task.perform (RoomMsg << sizeChange) Window.size 
    )


-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- UrlChange location ->
        --      { model | current = location } ! []

        RoomMsg roomMsg ->
            let
                (roomModel, cmds ) =
                    Room.Update.update roomMsg model.room
                _ = 
                    Debug.log "room" roomModel
            in
                ({ model | room = roomModel }, Cmd.map RoomMsg cmds)





onKeyPress : Int -> Msg
onKeyPress code =
    case (Char.fromCode code) of
        '8' ->
            RoomMsg <| Room.Update.SetActiveWall Top

        '6' ->
            RoomMsg <| Room.Update.SetActiveWall Right

        '2' ->
            RoomMsg <| Room.Update.SetActiveWall Bottom

        '4' ->
            RoomMsg <| Room.Update.SetActiveWall Left

        '5' ->
            RoomMsg <| Room.Update.SetActiveWall Center

        _ ->
            RoomMsg <| Room.Update.SetActiveWall Out



sizeChange : Size -> Room.Update.Msg
sizeChange size =
    Room.Update.SizeChange size


urlChange : Location -> Room.Update.Msg
urlChange location =
    Room.Update.UrlChange location


buildUrl : Wall -> String
buildUrl wall =
    case wall of
        Out ->
            "back"

        Center ->
            "center"

        Top ->
            "top"

        Right ->
            "right"

        Bottom ->
            "bottom"

        Left ->
            "left"


