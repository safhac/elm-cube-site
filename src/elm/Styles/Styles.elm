module Styles.Styles exposing (..)

import Html
import Html.Attributes exposing (style, class)


view3d : Html.Attribute msg
view3d =
    style
        [ ( "perspective", "500px")
        , ( "display", "inline-block")
        , ( "text-align",  "center")
        , ( "overflow", "hidden")
        ]



roomStyle : List ( String, String )
roomStyle =
        [ ("position", "relative")
        , ("transform-style", "preserve-3d")
        , ("transition", "all 1s ease-in-out")
        , ("width", "100%")
        , ("height", "100%")
        ]


navbar : Html.Attribute msg
navbar =
    style
        [ ( "width", "100%")
        , ( "display" , "flex" )
        , ( "position", "absolute")
        , ( "justify-content", "space-around" )
        , ( "z-index", "2" )
        ]

--   .navbar ul {
--     list-style-type: none;
--     text-transform: uppercase;
--   }
  
--   .navbar ul li {
--       margin: auto 10px;
--       padding: 5px;
--       display: inline;
--     }




