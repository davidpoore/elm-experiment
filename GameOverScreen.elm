module GameOverScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)


gameOverScreen : Html Msg
gameOverScreen =
    div [ onClick GameScreenClicked ]
        [ img [ src "images/game_over.png" ] []
        , text "Have a trophy."
        ]
