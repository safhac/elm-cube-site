module Update exposing (..)

import Window exposing (Size)
import Navigation
import Model exposing(Model)
import Task exposing (Task)
import Model exposing (Model)
import Char exposing (fromCode)
-- import Styles.Styles exposing (..)
-- import Styles.Room exposing (setAppStyles)

-- MSG

type Msg
    = UrlChange Navigation.Location
    | SizeChange Size
    | Top
    | Right
    | Bottom
    | Left
    | Center
    
    

--INIT

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , history = [ location ]
      }
    , Task.perform SizeChange Window.size
    )



onKeyPress : Int -> Msg
onKeyPress code =
    case (Char.fromCode code) of
        '8' ->
            Top
    
        '6' ->
            Right

        '2' ->
            Bottom

        '4' ->
            Left

        '5' ->
            Center
            
        _ ->
            Center



-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model
                | history = location :: model.history
              }
            , Cmd.none
            )

        SizeChange size ->
            ( { model
                | size = size
              }
            , Cmd.none
            )

        Top ->
            let location =
                List.head model.history
                _ = Debug.log "top " location
            in
                model ! []

        Right ->
            model ! []

        Bottom ->
            model ! []

        Left ->
            model ! []
        
        Center ->
            let location =
                List.head model.history
                _ = Debug.log "center " location
            in
                model ! []
         




getLastLocation : Model -> String
getLastLocation model =
    let
        history =
            model.history

        location =
            List.head history
    in
        case location of
            Just location ->
                toString location.hash

            Nothing ->
                "\"\""