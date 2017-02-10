-- module Room.Wall.View exposing (view)


-- import Html exposing (Html, div, ul, li, a, text, Attribute)
-- import Html.Attributes as Attributes exposing (class, style, id, href, classList, map)
-- import Room.Model exposing (Room, Wall)
-- import Room.Styles.Css as Css exposing (..)



-- view : Wall -> Wall -> Int -> Html msg
-- view wall active height_ =
--     div [ class "container" ]
--         [ div
--             [ classList
--                 [ ( "wall", True )
--                 , ( "top", room.active == Room.Model.Top )
--                 , ( "right", room.active == Room.Model.Right )
--                 , ( "floor", room.active == Room.Model.Bottom )
--                 , ( "left", room.active == Room.Model.Left )
--                 , ( "center", room.active == Room.Model.Center )
--                 ]
--             , Css.additionalStyles room
--             ]
--             --  (List.map toString room.walls
--             --     |> join " "
--             --     |> text
--             [ (buildWalls room) ]
--         ]
