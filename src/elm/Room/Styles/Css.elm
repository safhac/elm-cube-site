module Room.Styles.Css exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style, class)
import Room.Model exposing (..)


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


cubeStyle : Room -> Html.Attribute any
cubeStyle room =
    style
        [ ( "width", toString (room.size.width - 5) ++ "px" )
        , ( "height", toString (room.size.height - 5) ++ "px" )
        ]



{- additional cube styles for transforming center wall conforming to window height -}


additionalStyles : Room -> Html.Attribute msg
additionalStyles room =
    if room.active == Center then
        style
            [ ( "transform", "translateZ(" ++ toString room.size.height ++ "px)" )
            ]
    else
        style
            [ ( "width", "100%" ) ]



{- additional styles for center, right and left walls conforming to window height -}


additionalWallStyles : Wall -> Wall -> Int -> Html.Attribute msg
additionalWallStyles wall active height_ =
    if (wall == Room.Model.Right || wall == Room.Model.Left) && wall /= active then
        style
            [ ( "width", toString (height_) ++ "px" )
            ]
    else if (active == Room.Model.Bottom && wall == Room.Model.Top) || (active == Room.Model.Top && wall == Room.Model.Bottom) || ((active == Room.Model.Right || active == Room.Model.Left) && wall == Room.Model.Center) then
        style
            [ ( "display", "none" ) ]
    else if wall == Room.Model.Center then
        style
            [ ( "transform", "translateZ(-" ++ toString height_ ++ "px)" )
            , ( "opacity", "0.5" )
            ]
    else
        style
            [ ( "width", "100%" ) ]


{-alternative approarch send hole room and loop over walls-}
-- additionalRoomStyles : Room -> List (Html.Attribute msg)
-- additionalRoomStyles room =
--     List.map
--         (\wall ->
--             if (wall == Room.Model.Right || wall == Room.Model.Left) && wall /= room.active then
--                 style
--                     [ ( "width", toString (room.size.height) ++ "px" )
--                     ]
--             else if (room.active == Room.Model.Bottom && wall == Room.Model.Top) || (room.active == Room.Model.Top && wall == Room.Model.Bottom) || ((room.active == Room.Model.Right || room.active == Room.Model.Left) && wall == Room.Model.Center) then
--                 style
--                     [ ( "display", "none" ) ]
--             else if wall == Room.Model.Center then
--                 style
--                     [ ( "transform", "translateZ(-" ++ toString room.size.height ++ "px)" )
--                     , ( "opacity", "0.5" )
--                     ]
--             else
--                 style
--                     [ ( "width", "100%" ) ]
--         )
--         room.walls
