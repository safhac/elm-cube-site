module App.View exposing (view)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, id, href)
import App.Model exposing (..)
import App.Update exposing (..)
import Room.View as Room exposing (..)
import Room.Styles.Css exposing (view3d, cubeStyle)


-- VIEW


view : Model -> Html Msg
view model =
    div [ class "Elm-Application"]
        [ div [ class "navbar" ]
            [ 
            --     let
            --     r =
            --         model.room

            --     walls =
            --         r.walls
            --   in
            --     ul []
            --         (List.map (\wall -> viewLink <| toString wall ) walls)

            ]
        , div [ view3d, cubeStyle model.room ]
            [ Html.map RoomMsg <| Room.view model.room
            ]
        ]


viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name), id name ] [ text name ] ]
