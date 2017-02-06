module Rooms.Top exposing (..)

import Html as Html exposing (Html, Attribute, div, h1, img, text)
import Html.Attributes exposing (classList, class, src, alt)


-- import Model exposing (..)


content : String -> Html msg
content active =
    div 
        [ classList 
            [ ( "topContent", True)
            , ( "active", active == "top" )
            ]
        ]
        [ div []
            ( List.map showGiphy [ "angry", "dance", "gym", "massage", "piano", "tab" ] )
        ]
        


showGiphy : String -> Html msg
showGiphy name =
    img [ src (String.trim "/static/img/top/" ++ name ++ ".gif") ] []
