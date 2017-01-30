module Update exposing (..)

import Window exposing (Size)
import Navigation
import Model exposing(Model)
import Task exposing (Task)
import Model exposing (Model, emptyList)
import Styles.Room exposing (setAppStyles)

-- MSG

type Msg
    = UrlChange Navigation.Location
    | SizeChange Size
    
    

--INIT

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , history = [ location ]
      , appStyles =
            { roomStyle = emptyList
            , centerStyle = emptyList
            , topStyle = emptyList
            , rightStyle = emptyList
            , bottomStyle = emptyList
            , leftStyle = emptyList
            , centerLink = "center"
            }
      }
    , Task.perform SizeChange Window.size
    )



-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model
                | history = location :: model.history
                , appStyles = setAppStyles location.hash model.size
              }
            , Cmd.none
            )

        SizeChange size ->
            ( { model
                | size = size
                , appStyles = setAppStyles (getLastLocation model) size
              }
            , Cmd.none
            )



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