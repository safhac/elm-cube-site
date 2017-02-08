module Room.Styles.Css exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style, class)
import App.Model exposing (..)


-- import Room.Model exposing (..)


view3d : Html.Attribute msg
view3d =
    style
        [ ( "perspective", "500px" )
        , ( "display", "inline-block" )
        , ( "text-align", "center" )
        , ( "overflow", "hidden" )
        ]


roomStyle : List ( String, String )
roomStyle =
    [ ( "position", "relative" )
    , ( "transform-style", "preserve-3d" )
    , ( "transition", "all 1s ease-in-out" )
    , ( "width", "100%" )
    , ( "height", "100%" )
    ]


navbar : Html.Attribute msg
navbar =
    style
        [ ( "width", "100%" )
        , ( "display", "flex" )
        , ( "position", "absolute" )
        , ( "justify-content", "space-around" )
        , ( "z-index", "2" )
        ]



{- cube style conforming to window size -}


cubeStyle : Model -> Html.Attribute any
cubeStyle model =
    let
        room =
            model.room
    in
        style
            [ ( "width", toString (room.size.width - 5) ++ "px" )
            , ( "height", toString (room.size.height - 5) ++ "px" )
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
            , ( "opacity", "0.5" )
            ]
    else
        style
            [ ( "width", "100%" ) ]
