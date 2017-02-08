module Main exposing (..)

import Html exposing (Html, text, div, button)
import Html.Events exposing (onClick)
import List.Nonempty exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- TYPES


type Wall
    = Wall Int


type alias Model =
    { walls : Nonempty Wall
    }


type Msg
    = NoOp
    | Add Int



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( { walls = fromElement <| Wall 0
      }
    , Cmd.none
    )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Add num ->
            --model ! []
            ( { model
                | walls = cons (Wall num) (model.walls)
              }
            , Cmd.none
            )

        NoOp ->
            model ! []



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text <| toString model
        , button [ onClick <| Add <| length model.walls ] [ text "add" ]
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
