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
        , size = Size 0 0
    , walls = [ Out, Center, Top, Right, Bottom, Left ]
    }


update : Msg -> Room -> Room
update msg room =
    case msg of
        UrlChange location ->
            room

        SizeChange size ->
            room

        SetActiveWall wall ->
            room
