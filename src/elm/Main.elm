port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- component import example
import Components.Facebook as Facebook 


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { userStatus : String
    }


type alias User =
    { name : String
    , imgUrl : String
    , loginStatus : String
    , userType : UserType
    }


type UserType
    = Client
    | Vendor
    | Runner



--INIT


init : ( Model, Cmd Msg )
init =
    ( Model "", Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | StatusChange String
    | Login
    | Logout


port statusChange : (String -> msg) -> Sub msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StatusChange string ->
            ( { model | userStatus = string }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )

        Login ->
            ( model, Facebook.login {} )

        Logout ->
            ( model, Facebook.logout {} )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    statusChange StatusChange



-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ -- inline CSS (literal)
          div [ class "row" ]
            [ div [ class "col-xs-12" ]
                [ div [ class "jumbotron" ]
                    [ img [ src "static/img/elm.jpg", style styles.img ] []
                      -- inline CSS (via var)
                    , div [] []
                    , if model.userStatus == "connected" then
                        button [ class "btn btn-primary btn-lg", onClick Logout ]
                            [ span [ class "glyphicon glyphicon-star" ] [ text "Logout" ] ]
                      else
                        button [ class "btn btn-primary btn-lg", onClick Login ]
                            [ span [ class "glyphicon glyphicon-star" ] [ text "Login" ] ]
                    ]
                ]
            ]
        ]



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
