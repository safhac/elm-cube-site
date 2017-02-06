module Model exposing (Model)


import Window exposing (Size)
import Navigation


-- MODEL


type alias Model =
    { size : Size
    -- , history : List Navigation.Location
    , current : Navigation.Location
    }



