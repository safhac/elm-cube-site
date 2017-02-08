module Room.View exposing (..)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, style, id, href, classList)
import Room.Model exposing (Room)
import Room.Styles.Css as Room exposing (..)
import Room.Wall.Top as Top exposing (..)
import Char exposing (isLower)


view : Room -> Html msg
view room =
    div []
        [ let
            url =
                model.current

            currentWall =
                String.filter isLower url.hash
            
            room =
                model.room

            roomHeight =
                room.size |> .height
          in
            showRoom currentWall roomHeight
        ]



{- Display the room. classList determines which css class to add for 3d transformations for each view (up class="room roomTop", down class="room roomBottom" etc.. -}


showRoom : String -> Int -> Html msg
showRoom currentWall roomHeight =
    div
        [ classList
            [ ( "room", True )
            , ( "roomTop", currentWall == "top" )
            , ( "roomRight", currentWall == "right" )
            , ( "roomBottom", currentWall == "bottom" )
            , ( "roomLeft", currentWall == "left" )
            , ( "roomCenter", currentWall == "center" )
            ]
        , Room.additionalStyles currentWall roomHeight
        ]
        (List.map (\wall -> getRoomWall wall currentWall roomHeight) [ "center", "top", "right", "bottom", "left" ])



{- fills the room with walls styled according to the current view
   and window height
-}


getRoomWall : String -> String -> Int -> Html msg
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
        , Room.additionalWallStyles wall currentWall roomHeight
        ]
        [ case wall of
            "top" ->
                Top.content currentWall

            _ ->
                div [] []
        ]
