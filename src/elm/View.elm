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
                currentView = 
                    String.filter isLower url
              in
                showRoom currentView 
            ]
        ]

    
{- 
display the cube 
classList determines which css class to add inorder to transform the cube for each view (up, down, left, right).
the additional css classes are: 
top = roomTop, bottom = roomBottom etc..

the cube's walls are filled by calling getPage with the wall's name and the current view so each walls are styled accordingly
 -}
showRoom : String -> Html msg
showRoom currentView =
    div
        [ classList
            [ ( "room", True )
            , ( "roomTop", currentView == "top" )
            , ( "roomRight", currentView == "right" )
            , ( "roomBottom", currentView == "bottom" )
            , ( "roomLeft", currentView == "left" )
            , ( "roomCenter", currentView == "center" )
            ]
            
        ]
         ( List.map (flip getPage currentView )  [ "center", "top", "right", "bottom", "left" ] )
        


getPage : String -> String -> Html msg
getPage page currentView =
    div
        [ classList
            [ ( "wall", True )
            , ( "top", page == "top" && currentView /= "bottom" )
            , ( "right", page == "right" && currentView /= "left" )
            , ( "floor", page == "bottom" && currentView /= "top" )
            , ( "left", page == "left" && currentView /= "right" )
            , ( "center", page == "center" && currentView /= page )
            ]
            , Room.additionalStyles page
        ]
        [ text (page ++ " " ++ currentView) ]





viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name), id name ] [ text name ] ]
