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


