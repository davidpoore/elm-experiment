module PlayScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)


playScreen : GameState -> Html Msg
playScreen model =
    div [ onClick GameScreenClicked ]
        [ img [ src "images/game_started.png" ] []
        , text (toString model.clickCount)
        ]
