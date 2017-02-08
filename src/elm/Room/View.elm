module Room.View exposing (..)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, style, id, href, classList)
import Room.Model exposing (Room, Wall)
import Room.Styles.Css as Css exposing (..)
import Room.Wall.Top as Top exposing (..)


view : Room -> Html msg
view model =
    div []
        [ buildRoom model
        ]


{- Display the room. classList determines which css class to add for 3d transformations for each view (up class="room roomTop", down class="room roomBottom" etc.. -}


buildRoom : Room -> Html msg
buildRoom room =
    div
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
         [ text "room" ]



-- (List.map (\w -> getRoomWall w room.active) [ "center", "top", "right", "bottom", "left" ])
{- fills the room with walls styled according to the current view
   and window height
-}


{- getRoomWall : String -> String -> Int -> Html msg
 getRoomWall wall currentWall roomHeight =
     div
         [ classList
             [ ( "wall", True )
             , ( "top", wall == "top" )
             , ( "right", wall == "right" )
             , ( "floor", wall == "bottom" )
             , ( "left", wall == "left" )
             , ( "center", wall == "center" )
             ]
         , Css.additionalWallStyles wall currentWall roomHeight
         ]
         [ case wall of
             "top" ->
                 Top.content currentWall

-}