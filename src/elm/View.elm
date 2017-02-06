module View exposing (view)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, style, id, href, classList)
import Model exposing (Model)
import Styles.Styles as Styles exposing (..)
import Styles.Room as Room exposing (..)
import Rooms.Top as Top exposing (..)
import Char exposing (isLower)


-- VIEW


view : Model -> Html msg
view model =
    div []
        [ div [ class "navbar" ]
            [ ul []
                (List.map viewLink [ "center", "top", "right", "bottom", "left" ])
            ]
        , div [ view3d, cubeStyle model, id "view3d" ]
            [ let
                url =
                    model.current

                currentWall =
                    String.filter isLower url.hash

                roomHeight =
                    model.size |> .height
              in
                showRoom currentWall roomHeight
            ]
        ]



{- Display the room. classList determines which css class to add for 3d transformations for each view (up class="room roomTop", down class="room roomBottom" etc..-}
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
and window height -}
getRoomWall : String -> String -> Int -> Html msg
getRoomWall wall currentWall roomHeight =
    div
        [ classList
            [ ( "wall", True )
            , ( "top", wall == "top")
            , ( "right", wall == "right")
            , ( "floor", wall == "bottom")
            , ( "left", wall == "left")
            , ( "center", wall == "center")
            ]
        , Room.additionalWallStyles wall currentWall roomHeight
        ]
        [ 
            -- if wall == currentWall && wall == "top" then
            --     Top.content 
            -- else
            --     div [] []

            case wall of
                "top" ->
                    Top.content currentWall
                _ ->
                    div [] []
        ]



viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name), id name ] [ text name ] ]
