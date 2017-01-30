module View exposing (view)


import Html exposing (..)
import Html.Attributes exposing (..)
import Styles.Styles exposing (..)
import Model exposing (Model)
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



-- CSS STYLES


cubeStyle : Model -> Attribute any
cubeStyle model =
    style
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]





