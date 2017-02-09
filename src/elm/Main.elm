module Main exposing (..)

import Window exposing (Size)
import Navigation exposing (program)
import Keyboard exposing (presses)
import App.Model exposing (..)
import App.Update exposing (Msg(..), onKeyPress, sizeChange, urlChange)
import App.View exposing (view)


-- MAIN


main : Program Never Model Msg
main =
    Navigation.program (RoomMsg << urlChange)
        { init = App.Update.init
        , view = App.View.view
        , update = App.Update.update
        , subscriptions = subscriptions
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Window.resizes (RoomMsg << sizeChange)
        , Keyboard.presses onKeyPress
        ]
