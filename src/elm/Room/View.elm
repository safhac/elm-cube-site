module Room.View exposing (..)

import Html exposing (Html, div, h1, p, ul, li, a, text, Attribute)
import Html.Attributes as Attributes exposing (class, style, id, href, classList, map)
import Touch exposing (TouchEvent(..), Touch)
import SingleTouch exposing (SingleTouch, onSingleTouch)
import Room.Model exposing (Room, Wall)
import Room.Update exposing (..)
import Room.Styles.Css as Css exposing (..)
import Room.Wall.Top as Top exposing (..)
import Room.Update exposing (..)


view : Room -> Html Msg
view room =
    div [ class "roomContainer" ]
        [ div
            [ classList
                [ ( "room", True )
                , ( "roomTop", room.active == Room.Model.Top )
                , ( "roomRight", room.active == Room.Model.Right )
                , ( "roomBottom", room.active == Room.Model.Bottom )
                , ( "roomLeft", room.active == Room.Model.Left )
                , ( "roomCenter", room.active == Room.Model.Center )
                ]
            , Css.additionalStyles room
            , onTouchStart
            , onTouchMove
            , onTouchEnd
            , onTouchCancel
            ]
            {- debugging purposes -}
            -- [
            --     h1 [] [text room.message]
            -- ]
            (List.map
                (\wall -> buildWalls wall room.active room.size.height)
                room.walls)
        ]



{- fills the room with walls styled according to the current view
   and window height
-}


buildWalls : Wall -> Wall -> Int -> Html msg
buildWalls wall active height_ =
    div
        [ classList
            [ ( "wall", True )
            , ( "top", wall == Room.Model.Top )
            , ( "right", wall == Room.Model.Right )
            , ( "floor", wall == Room.Model.Bottom )
            , ( "left", wall == Room.Model.Left )
            , ( "center", wall == Room.Model.Center )
            ]
        , Css.additionalWallStyles wall active height_
        ]
        [ case wall of
            Room.Model.Top ->
                Top.content active

            Room.Model.Center ->
                div [ class "content" ]
                    [ h1 [] [ text "5" ]
                    , a [ href "https://github.com/safhac/elm-cube-site" ]
                        [ h1 [] [ text "https://github.com/safhac/elm-cube-site" ]
                        ]
                    ]

            Room.Model.Right ->
                div [ class "content" ]
                    [ a [ href ("#right") ]
                        [ h1 [] [ text "6" ]
                        ]
                    ]

            Room.Model.Bottom ->
                div [ class "content" ]
                    [ h1 [] [ text "2" ]
                    ]

            Room.Model.Left ->
                div [ class "content" ]
                    [ h1 [] [ text "4" ]
                    ]

            _ ->
                div [] []
        ]


onTouchStart : Attribute Msg
onTouchStart =
    onSingleTouch TouchStart Touch.preventAndStop <| SingleTouchMsg


onTouchMove : Attribute Msg
onTouchMove =
    onSingleTouch TouchMove Touch.preventAndStop <| SingleTouchMsg


onTouchEnd : Attribute Msg
onTouchEnd =
    onSingleTouch TouchEnd Touch.preventAndStop <| SingleTouchMsg


onTouchCancel : Attribute Msg
onTouchCancel =
    onSingleTouch TouchCancel Touch.preventAndStop <| SingleTouchMsg



-- onAllTouch : List (Attribute Msg)
-- onAllTouch =
--     [ onSingleTouch TouchStart Touch.preventAndStop <| SingleTouchMsg
--     , onSingleTouch TouchMove Touch.preventAndStop <| SingleTouchMsg
--     , onSingleTouch TouchEnd Touch.preventAndStop <| SingleTouchMsg
--     , onSingleTouch TouchCancel Touch.preventAndStop <| SingleTouchMsg
--     ]
