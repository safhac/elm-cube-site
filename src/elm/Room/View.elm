module Room.View exposing (..)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes as Attributes exposing (class, style, id, href, classList, map)
import Room.Model exposing (Room, Wall)
import Room.Styles.Css as Css exposing (..)


-- import String exposing (..)
-- import Room.Wall.Top as Top exposing (..)


view : Room -> Html msg
view room =
    div [ class "container" ]
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
            ]
            --  (List.map toString room.walls
            --     |> join " "
            --     |> text
            [ (buildWalls room) ]
        ]



{- fills the room with walls styled according to the current view
   and window height
-}
buildWalls : Room -> Html msg
buildWalls room =
    div
        ([ classList
            [ ( "wall", True )
            , ( "top", room.active == Room.Model.Top )
            , ( "right", room.active == Room.Model.Right )
            , ( "floor", room.active == Room.Model.Bottom )
            , ( "left", room.active == Room.Model.Left )
            , ( "center", room.active == Room.Model.Center )
            ]
         ]
            ++ Css.additionalRoomStyles room
        )
        []
