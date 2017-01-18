module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Window exposing (Size)
import Navigation
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
    , appStyles : AppStyles
    }


type alias AppStyles =
    { roomStyle : List ( String, String )
    , centerStyle : List ( String, String )
    , topStyle : List ( String, String )
    , rightStyle : List ( String, String )
    , bottomStyle : List ( String, String )
    , leftStyle : List ( String, String )
    , centerLink : String
    }


emptyList : List ( String, String )
emptyList =
    [ ( "", "" ) ]



--INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , history = [ location ]
      , appStyles =
            { roomStyle = emptyList
            , centerStyle = emptyList
            , topStyle = [ ( "transform", "rotateX(-90deg)" ) ]
            , rightStyle = emptyList
            , bottomStyle = emptyList
            , leftStyle = emptyList
            , centerLink = "center"
            }
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
            ( { model
                | history = location :: model.history
                , appStyles = setAppStyles location.hash model.size
              }
            , Cmd.none
            )

        SizeChange size ->
            ( { model
                | size = size
                , appStyles = setAppStyles (getLastLocation model) size
              }
            , Cmd.none
            )


getLastLocation : Model -> String
getLastLocation model =
    let
        history =
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
            [ ul []
                (List.map viewLink [ model.appStyles.centerLink, "top", "right", "bottom", "left" ])
            ]
        , div [ class "view3d", cubeStyle model ]
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


setAppStyles : String -> Size -> AppStyles
setAppStyles hash winSize =

    if hash == "\"\"" || hash == "#back" then
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "center"
        }

    else if hash == "#center" then
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(0)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else if hash == "#top" then
        { roomStyle =
            [ ( "transform-origin", "center top" )
            , ( "transform", "rotateX(90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" ) ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = [( "opacity", "1" )]
        , bottomStyle = [( "display", "none" )]
        , centerLink = "back"
        }

    else if hash == "#right" then
        { roomStyle =
            [ ( "transform-origin", "center right" )
            , ( "transform", "rotateY(90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", "0" )
            ]
        , rightStyle = [( "opacity", "1" )]
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else if hash == "#bottom" then
        { roomStyle =
            [ ( "transform-origin", "center bottom" )
            , ( "transform", "rotateX(-90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", ".3" )
            ]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = [( "display", "none" ) ]
        , bottomStyle = [( "opacity", "1" )]
        , centerLink = "back"
        }

    else if hash == "#left" then
        { roomStyle =
            [ ( "transform-origin", "center left" )
            , ( "transform", "rotateY(-90deg)" )
            ]
        , centerStyle =
            [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
            , ( "opacity", "0" )
            ]
        , rightStyle =emptyList
        , leftStyle = [( "opacity", "1" )]
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "back"
        }

    else
        { roomStyle = emptyList
        , centerStyle = [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )]
        , rightStyle = emptyList
        , leftStyle = emptyList
        , topStyle = emptyList
        , bottomStyle = emptyList
        , centerLink = "center"
        }


setRoomStyle : String -> Int -> List ( String, String )
setRoomStyle hash winHeight =
    if hash == "#tutorial" then
        [ ( "transform", "translateZ(" ++ (toString winHeight) ++ "px)" )
        ]
    else if hash == "#core" then
        [ ( "transform-origin", "center top" )
        , ( "transform", "rotateX(90deg)" )
        ]
    else if hash == "#html" then
        [ ( "transform-origin", "center bottom" )
        , ( "transform", "rotateX(-90deg)" )
        ]
    else if hash == "#packages" then
        [ ( "transform-origin", "center right" )
        , ( "transform", "rotateY(90deg)" )
        ]
    else if hash == "#org" then
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
    else if hash == "#org" || hash == "#packages" then
        [ ( "width", "0" )
        ]
    else
        [ ( "transform", "translateZ(-" ++ toString winSize.height ++ "px)" )
        ]
