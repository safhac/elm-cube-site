module Styles.Room exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Model exposing (..)


{- cube style conforming to window size -}


cubeStyle : Model -> Html.Attribute any
cubeStyle model =
    style
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]



{- additional cube styles for transforming center wall conforming to window height -}


additionalStyles : String -> Int -> Html.Attribute msg
additionalStyles currentWall height_ =
    if currentWall == "center" then
        style
            [ ( "transform", "translateZ(" ++ toString height_ ++ "px)" )
            ]
    else
        style
            [ ( "width", "100%" ) ]



{- additional styles for center, right and left walls conforming to window height -}


additionalWallStyles : String -> String -> Int -> Html.Attribute msg
additionalWallStyles page view height_ =
    if (page == "right" || page == "left") && page /= view then
        style
            [ ( "width", toString height_ ++ "px" )
            ]
    else if (view == "bottom" && page == "top") || (view == "top" && page == "bottom") || ((view == "right" || view == "left") && page == "center") then
        style
            [ ( "display", "none" ) ]
    else if page == "center" then
        style
            [ ( "transform", "translateZ(-" ++ toString height_ ++ "px)" ) 
            , ("opacity", "0.5")]
    else
        style
            [ ( "width", "100%" ) ]
