module Update exposing (..)

import Window exposing (Size)
import Navigation
import Model exposing(Model)
import Task exposing (Task)
import Model exposing (Model)
import Char exposing (fromCode)


-- MSG

type Msg
    = UrlChange Navigation.Location
    | SizeChange Size
    | Top
    | Right
    | Bottom
    | Left
    | Center
    | Back
    
    

--INIT

init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { size = Size 0 0
      , current = location
      }
    , Task.perform SizeChange Window.size
    )



onKeyPress : Int -> Msg
onKeyPress code =
    case (Char.fromCode code) of
        '8' ->
            Top
    
        '6' ->
            Right

        '2' ->
            Bottom

        '4' ->
            Left

        '5' ->
            Center
            
        _ ->
            Back



-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model
                |  current = location 
              }
            , Cmd.none
            )

        SizeChange size ->
            ( { model
                | size = size
              }
            , Cmd.none
            )

        Top ->
            let 
                oldView =
                    model.current
                goUp =
                    Navigation.newUrl (oldView.origin ++ "#top")
            in
                (model, goUp)

        Right ->
            let 
                oldView =
                    model.current
                goRight =
                    Navigation.newUrl (oldView.origin ++ "#right")
            in
                (model, goRight)

        Bottom ->
            let 
                oldView =
                    model.current
                goDown =
                    Navigation.newUrl (oldView.origin ++ "#bottom")
            in
                (model, goDown)

        Left ->
            let 
                oldView =
                    model.current
                goLeft =
                    Navigation.newUrl (oldView.origin ++ "#left")
            in
                (model, goLeft)
        
        Center ->
            let 
                oldView =
                    model.current
                goIn =
                    Navigation.newUrl (oldView.origin ++ "#center")
            in
                (model, goIn)

        Back ->
            let 
                oldView =
                    model.current
                goOut =
                    Navigation.newUrl (oldView.origin ++ "")
            in
                (model, goOut)


