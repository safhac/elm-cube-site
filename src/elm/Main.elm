module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
-- import Element exposing (toHtml)
import Html.Events exposing (onClick)
import Window exposing (Size)
import Navigation
import Debug exposing (log)
import Task exposing (Task)


-- MAIN


main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Window.resizes SizeChange)
        }



-- MODEL


type alias Model =
    { size : Size
    , history : List Navigation.Location
    , styleProps : List (String, String)
    }



--INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0 
      , history = [ location ]
      , styleProps = [("", "")]
      }
    , Task.perform SizeChange Window.size
    )



-- UPDATE


type Msg
    = UrlChange Navigation.Location
    | SizeChange Size


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | history = location :: model.history
                , styleProps = setStyle location.hash model.size.height }
              , Cmd.none
            )
        SizeChange size ->
            ( { model | size = size }
            , Cmd.none
            )



-- VIEW


view : Model -> Html msg
view model =
    div []
        [
        div [ class "navbar" ]
            [ ul [] (List.map viewLink [ "center", "top", "floor", "left", "right" ])
            ]
        ,
        div [ class "view3d", cubeStyle model ]
            [ div [ class "room", style model.styleProps ]
                [ div [ id "ceil", class "wall top" ] []
                , div [ class "wall floor" ] []
                , div [ class "wall left" ] []
                , div [ class "wall right" ] []
                , div [ class "wall center", centerStyle model ] []
                ]
            ]
        ]


viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name) ] [ text name ] ]



-- CSS STYLES

cubeStyle : Model -> Attribute any
cubeStyle model =
      style
          [ ( "width", toString (model.size.width - 5 ) ++ "px")
          , ( "height", toString (model.size.height - 5 ) ++ "px")
          ]


centerStyle : Model -> Attribute any
centerStyle model =
      style
          [ ( "transform", "translateZ(-" ++ toString model.size.height ++ "px)")
          ]



setStyle : String -> Int -> List (String, String)
setStyle hash winHeight =
    if hash == "#center" then
        [ ("transform", "translateZ(" ++ (toString winHeight) ++ "px)")
            ]
    else if hash == "#top" then
        [ ( "transform-origin" , "center top" )
          , ("transform", "rotateX(90deg)" )
        ]
    else if hash == "#floor" then
        [ ( "transform-origin" , "center bottom" )
          , ("transform", "rotateX(-90deg)" )
        ]    
    else if hash == "#right" then
        [ ( "transform-origin" , "center right" )
          , ("transform", "rotateY(90deg)" )
        ]      
    else if hash == "#left" then
        [ ( "transform-origin" , "center left" )
          , ("transform", "rotateY(-90deg)" )
        ]      
    else
        [("","")]