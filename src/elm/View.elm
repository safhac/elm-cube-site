module View exposing (view)

import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, style, id, href, classList)
import Model exposing (Model)
import Update exposing (getLastLocation)
import Styles.Styles as Styles exposing (..)
import Styles.Room as Room exposing (..)
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
                    getLastLocation model

                currentWall =
                    String.filter isLower url

                roomHeight =
                    model.size |> .height
              in
                showRoom currentWall roomHeight
            ]
        ]



{- display the cube - classList determines which css class to add for 3d transformations for each view (up class="room roomTop", down class="room roomBottom" etc..-}
showRoom : String -> Int -> Html msg
showRoom currentWall height_ =
    div
        [ classList
            [ ( "room", True )
            , ( "roomTop", currentWall == "top" )
            , ( "roomRight", currentWall == "right" )
            , ( "roomBottom", currentWall == "bottom" )
            , ( "roomLeft", currentWall == "left" )
            , ( "roomCenter", currentWall == "center" )
            ]
        , Room.additionalStyles currentWall height_
        ]
        --(flip getPage currentWall)
        (List.map (\page -> getPage page currentWall height_) [ "center", "top", "right", "bottom", "left" ])



{- fills the cube with walls styled according to the current view
and window height -}
getPage : String -> String -> Int -> Html msg
getPage page currentWall height_ =
    div
        [ classList
            [ ( "wall", True )
            , ( "top", page == "top")
            , ( "right", page == "right")
            , ( "floor", page == "bottom")
            , ( "left", page == "left")
            , ( "center", page == "center")
            ]
        , Room.additionalWallStyles page currentWall height_
        ]
        [ text (page ++ " " ++ currentWall) ]



viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name), id name ] [ text name ] ]
