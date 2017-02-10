module Room.Model exposing (..)



import Window exposing (Size)



type Wall
    = Out
    | Center
    | Top
    | Right
    | Bottom
    | Left


-- MODEL


type alias Room =
    { active : Wall
    , size : Size
    , walls : List Wall
    }


  