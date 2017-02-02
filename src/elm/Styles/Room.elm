module Styles.Room exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Model exposing (..)


-- import Styles.Styles as Styles exposing (..)


cubeStyle : Model -> Html.Attribute any
cubeStyle model =
    style
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]


additionalStyles : String -> Html.Attribute msg
additionalStyles page =
    if page == "right" || page == "left" then
        style
            [ ( "width", "50%" )
            ]
    else
        style
            [ ( "width", "100%" ) ]



-- type alias AppStyles =
--     { bottomStyle : Attribute msg
--     , centerLink : String
--     , centerStyle : Attribute msg1
--     , leftStyle : Attribute msg2
--     , rightStyle : Attribute msg3
--     , roomStyle : Attribute msg4
--     , topStyle : Attribute msg5
--     }
-- defaultRoom : {}
-- defaultRoom =
--     {
--     roomStyle = Styles.room
--     , centerStyle = Styles.center
--     , topStyle = Styles.top
--     , rightStyle = Styles.right
--     , bottomStyle = Styles.floor
--     , leftStyle = Styles.left
--     , centerLink = "Center"
--     }
-- setAppStyles : String -> Size -> AppStyles
-- setAppStyles hash winSize =
--     if hash == "\"\"" || hash == "#back" then
--         { roomStyle = [("", "")]
--         , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [("", "")]
--         , bottomStyle = [("", "")]
--         , centerLink = "center"
--         }
--     else if hash == "#center" then
--         { roomStyle = [ ( "transform", "translateZ(" ++ toString winSize.height ++ "px)" ) ]
--         , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [("", "")]
--         , bottomStyle = [("", "")]
--         , centerLink = "back"
--         }
--     else if hash == "#top" then
--         { roomStyle =
--             [ ( "transform-origin", "center top" )
--             , ( "transform", "rotateX(90deg)" )
--             ]
--         , centerStyle =
--             [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [("", "")]
--         , bottomStyle = [( "display", "none" )]
--         , centerLink = "back"
--         }
--     else if hash == "#right" then
--         { roomStyle =
--             [ ( "transform-origin", "center right" )
--             , ( "transform", "rotateY(90deg)" )
--             ]
--         , centerStyle =
--             [ ( "display", "none" )
--             , ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
--             ]
--         , rightStyle = [("width", toString winSize.width ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [("", "")]
--         , bottomStyle = [("", "")]
--         , centerLink = "back"
--         }
--     else if hash == "#bottom" then
--         { roomStyle =
--             [( "transform-origin", "center bottom" )
--             , ( "transform", "rotateX(-90deg)" )
--             ]
--         , centerStyle =
--             [( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [( "display", "none" )]
--         , bottomStyle = [( "", "" )]
--         , centerLink = "back"
--         }
--     else if hash == "#left" then
--         { roomStyle =
--             [ ( "transform-origin", "center left" )
--             , ( "transform", "rotateY(-90deg)" )
--             ]
--         , centerStyle =
--             [ ( "display", "none" )
--             , ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
--             ]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("", "")]
--         , topStyle = [("", "")]
--         , bottomStyle = [("", "")]
--         , centerLink = "back"
--         }
--     else
--         { roomStyle = [("", "")]
--         , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
--         , rightStyle = [("width", toString winSize.height ++ "px")]
--         , leftStyle = [("width", toString winSize.height ++ "px")]
--         , topStyle = [("", "")]
--         , bottomStyle = [("", "")]
--         , centerLink = "center"
--         }
