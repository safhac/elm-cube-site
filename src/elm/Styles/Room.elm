module Styles.Room exposing(..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Window exposing (Size)
import Model exposing (Model, emptyList, AppStyles)


setAppStyles : String -> Size -> AppStyles
setAppStyles hash winSize =

    if hash == "\"\"" || hash == "#back" then
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "center"
        }

    else if hash == "#center" then
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(0)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else if hash == "#top" then
        { roomStyle =
            [ ( "transform-origin", "center top" )
            , ( "transform", "rotateX(90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = [( "opacity", "1" )]
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
        , rightStyle = [( "opacity", "1" )]
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else if hash == "#bottom" then
        { roomStyle =
            [ ( "transform-origin", "center bottom" )
            , ( "transform", "rotateX(-90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", ".3" )
            ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = [( "display", "none" ) ]
        , bottomStyle = [( "opacity", "1" )]
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
        , rightStyle =emptyList
        , leftStyle = [( "opacity", "1" )]
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "center"
        }



cubeStyle : Model -> Html.Attribute any
cubeStyle model =
    style
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]