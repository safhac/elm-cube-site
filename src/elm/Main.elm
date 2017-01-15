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
    , roomStyle : List ( String, String )
    , centerStyle : List ( String, String )
    }



--INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , history = [ location ]
      , roomStyle = [ ( "", "" ) ]
      , centerStyle = [ ( "", "" ) ]
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
            let 
                _ = Debug.log "url" location.hash
            in 
                ( { model
                    | history = location :: model.history
                    , roomStyle = setRoomStyle location.hash model.size.height
                    , centerStyle = setCenterStyle location.hash model.size
                }
                , Cmd.none
                )

        SizeChange size ->
            let 
                _ = Debug.log "SizeChange size " size
            in 
                ( { model | size = size 
                , roomStyle = setRoomStyle (getLastLocation model) size.height
                , centerStyle = setCenterStyle (getLastLocation model ) size }
                , Cmd.none
                )


getLastLocation : Model -> String
getLastLocation model =
    let history =
            model.history
        location =
            List.head history
    in 
        case location of 
            Just location ->
                toString location.hash
            Nothing ->
                ""

-- VIEW


view : Model -> Html msg
view model =
    div []
        [ div [ class "navbar" ]
            [ ul [] (List.map viewLink [ "home", "center", "top", "floor", "left", "right" ])
            ]
        , div [ class "view3d", cubeStyle model ]
            [ div [ class "room", style model.roomStyle ]
                [ div [ class "wall top" ] []
                , div [ class "wall floor" ] []
                , div [ class "wall left" ] []
                , div [ class "wall right" ] []
                , div [ class "wall center", style model.centerStyle ] []
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
        [ ( "width", toString (model.size.width - 5) ++ "px" )
        , ( "height", toString (model.size.height - 5) ++ "px" )
        ]



setRoomStyle : String -> Int -> List ( String, String )
setRoomStyle hash winHeight =
    if hash == "#center" then
        [ ( "transform", "translateZ(" ++ (toString winHeight) ++ "px)" )
        ]
    else if hash == "#top" then
        [ ( "transform-origin", "center top" )
        , ( "transform", "rotateX(90deg)" )
        ]
    else if hash == "#floor" then
        [ ( "transform-origin", "center bottom" )
        , ( "transform", "rotateX(-90deg)" )
        ]
    else if hash == "#right" then
        [ ( "transform-origin", "center right" )
        , ( "transform", "rotateY(90deg)" )
        ]
    else if hash == "#left" then
        [ ( "transform-origin", "center left" )
        , ( "transform", "rotateY(-90deg)" )
        ]
    else
        [ ( "", "" ) ]


setCenterStyle : String -> Size -> List ( String, String )
setCenterStyle hash winSize =
    if hash == "" || hash == "#home" then
        [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
        ]
    else if hash == "#left" || hash == "#right"  then
        [ ( "width", "0" )
        ]    
    else
         [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
        ]
