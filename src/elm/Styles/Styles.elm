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


room : Html.Attribute msg
room =
    style
        [ ("position", "relative")
        , ("transform-style", "preserve-3d")
        , ("transition", "all 1s ease-in-out")
        , ("width", "inherit")
        , ("height", "inherit")
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

wall : Html.Attribute msg
wall =
    style 
        [ ( "position", "absolute")
        , ( "opacity", "0.5")
        ]
  


center : Html.Attribute msg
center =
    style 
        [ ( "background-color", "lightpink")
        , ( "z-index", "2")
        , ( "opacity", "1")
        , ( "transition" , "all 1s ease-in-out")
        ]


top : Html.Attribute msg
top = 
    style 
    [ ( "background-color", "lightcoral")
    , ( "transform-origin", "center top")
    , ( "transform", "rotateX(-90deg)")
    , ( "text-align", "center")
    ]



floor : Html.Attribute msg
floor = 
    style 
    [ ( "background-color", "lightblue")
    , ("transform-origin", "center bottom")
    , ("transform", "rotateX(90deg)")
    ]



right : Html.Attribute msg
right =
    style 
    [ ( "right", "0")
    , ("background-color", "#8eea7c")
    , ("transform", "rotateY(-90deg)")
    , ("transform-origin", "right center")
    , ("text-align", "right")
    ]



left : Html.Attribute msg
left =
    style 
    [ ("background-color", "lightseagreen")
    , ("transform", "rotateY(90deg)")
    , ("transform-origin", "left center")
    , ("text-align", "left")
    ]


-- .top, .floor, .center, .left, .right {
--     margin: 0 auto;
--     height: 100%;
--     width: 100%;
-- }        