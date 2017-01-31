module Model exposing (..)

import Window exposing (Size)
import Navigation
-- import Html exposing (Attribute)
-- import Html.Attributes exposing (style)
-- import Styles.Styles exposing (..)

-- MODEL


type alias Model =
    { size : Size
    , history : List Navigation.Location
    , appStyles : AppStyles 
    }


type alias AppStyles =
    { roomStyle : EmptyList
    , centerStyle : EmptyList
    , topStyle : EmptyList
    , rightStyle : EmptyList
    , bottomStyle : EmptyList
    , leftStyle : EmptyList
    , centerLink : String
    }


type alias EmptyList = List ( String , String ) 

    -- type AppStyle =
--     Center
--     | Room
--     | Right
--     | Left
--     | Top
--     | Floor


-- type alias AppStyles =
--     { roomStyle : AppStyle
--     , centerStyle : AppStyle
--     , topStyle : AppStyle
--     , rightStyle : AppStyle
--     , bottomStyle : AppStyle
--     , leftStyle : AppStyle
--     , centerLink : String
--     }