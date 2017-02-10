module Room.Update exposing (..)

import Window exposing (Size)
import Navigation exposing (Location)
import Room.Model exposing (..)


type Msg
    = SizeChange Size
    | UrlChange Location
    | SetActiveWall Wall



initialModel : Room
initialModel =
    { active = Out 
        , size = Size 600 600
    , walls = [ Center, Top, Right, Bottom, Left ]
    }


update : Msg -> Room -> (Room, Cmd Msg)
update msg room =
    case msg of
        UrlChange location ->
            let 
                activeWall
                    = getWallFromLocation location 

            in 
             ( { room | active = activeWall }, Cmd.none)

        SizeChange size_ ->
            ({ room | size = size_ }, Cmd.none)

        SetActiveWall wall ->
            ({ room | active = wall }, Cmd.none)



getWallFromLocation : Location -> Wall
getWallFromLocation location =   
    case String.toLower location.hash of
        "#back" ->
                Out
        "#center" ->
                Center
        "#top" ->
                Top
        "#right" ->
                Right
        "#bottom" ->
                Bottom
        "#left" ->
                Left
        _ ->
                Out