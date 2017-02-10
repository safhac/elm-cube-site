module Room.Wall.Top exposing (..)

import Html as Html exposing (Html, Attribute, div, h1, img, text)
import Html.Attributes exposing (classList, class, src, alt)

import Room.Model exposing (..)


content : Wall -> Html msg
content active =
    div
        [ classList
            [ ( "topContent", True )
            , ( "active", active == Room.Model.Top )
            ]
        ]
        [ h1 [] [ text "2" ]
        , div []
            (
                
                [ "angry", "dance", "gym", "massage", "piano", "tab" ]
                |> List.map showGiphy
                
            ) 
        ]


showGiphy : String -> Html msg
showGiphy name =
    img
        [ src <|
            String.trim <|
                "/static/img/top/"
                    ++ name
                    ++ ".gif"
        ]
        []
