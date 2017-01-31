module View exposing (view)


import Html exposing (Html, div, ul, li, a, text, Attribute)
import Html.Attributes exposing (class, style, id, href)
import Model exposing (Model)
import Styles.Styles exposing (..)
import Styles.Room exposing (..)



-- VIEW


view : Model -> Html msg
view model =
    div []
        [ div [ class "navbar" ]
            [ ul []
                (List.map viewLink [ model.appStyles.centerLink, "top", "right", "bottom", "left" ])
            ]
        , div [ view3d, cubeStyle model ]
            [ div [ class "room", style model.appStyles.roomStyle ]
                [ div [ class "wall top" ] []
                , div [ class "wall floor", style model.appStyles.bottomStyle ] []
                , div [ class "wall left", style model.appStyles.leftStyle ] []
                , div [ class "wall right", style model.appStyles.rightStyle ] []
                , div [ class "wall center", style model.appStyles.centerStyle ] []
                ]
            ]
        ]


viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name), id name ] [ text name ] ]









