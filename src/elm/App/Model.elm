module App.Model exposing (..)

import Navigation exposing (Location)
import Room.Model exposing (..)


-- MODEL


type alias Model =
    { current : Navigation.Location
    , room : Room
    }
