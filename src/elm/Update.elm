module Update exposing (..)

import Window exposing (Size)
import Navigation
import Model exposing(Model, emptyList, AppStyles)
import Task exposing (Task)
-- import Styles.Styles exposing (..)

-- MSG


type Msg
    = UrlChange Navigation.Location
    | SizeChange Size
    
    
--INIT


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , history = [ location ]
      , appStyles =
            { roomStyle = emptyList
            , centerStyle = emptyList
            , topStyle = emptyList
            , rightStyle = emptyList
            , bottomStyle = emptyList
            , leftStyle = emptyList
            , centerLink = "center"
            }
      }
    , Task.perform SizeChange Window.size
    )


-- UPDATE
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
                "\"\""



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