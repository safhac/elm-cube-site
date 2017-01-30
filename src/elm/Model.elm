module Model exposing (..)


import Window exposing (Size)
import Navigation

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