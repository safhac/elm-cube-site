module Styles.Room exposing(..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Window exposing (Size)
import Model exposing (..)


setAppStyles : String -> Size -> AppStyles
setAppStyles hash winSize =

    if hash == "\"\"" || hash == "#back" then
        { roomStyle = [("", "")]
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [("", "")]
        , bottomStyle = [("", "")]
        , centerLink = "center"
        }

    else if hash == "#center" then
        { roomStyle = [ ( "transform", "translateZ(" ++ toString winSize.height ++ "px)" ) ]
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [("", "")]
        , bottomStyle = [("", "")]
        , centerLink = "back"
        }

    else if hash == "#top" then
        { roomStyle =
            [ ( "transform-origin", "center top" )
            , ( "transform", "rotateX(90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [("", "")]
        , bottomStyle = [( "display", "none" )]
        , centerLink = "back"
        }

    else if hash == "#right" then
        { roomStyle =
            [ ( "transform-origin", "center right" )
            , ( "transform", "rotateY(90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", "0" )
            ]
        , rightStyle = [("width", toString winSize.width ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [("", "")]
        , bottomStyle = [("", "")]
        , centerLink = "back"
        }

    else if hash == "#bottom" then
        { roomStyle =
            [( "transform-origin", "center bottom" )
            , ( "transform", "rotateX(-90deg)" )
            ]
        , centerStyle =
            [( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [( "display", "none" )]
        , bottomStyle = [( "", "" )]
        , centerLink = "back"
        }

    else if hash == "#left" then
        { roomStyle =
            [ ( "transform-origin", "center left" )
            , ( "transform", "rotateY(-90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", "0" )
            ]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("", "")]
        , topStyle = [("", "")]
        , bottomStyle = [("", "")]
        , centerLink = "back"
        }

    else
        { roomStyle = [("", "")]
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
        , rightStyle = [("width", toString winSize.height ++ "px")]
        , leftStyle = [("width", toString winSize.height ++ "px")]
        , topStyle = [("", "")]
        , bottomStyle = [("", "")]
        , centerLink = "center"
        }



cubeStyle : Model -> Html.Attribute any
cubeStyle model =
    style
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]