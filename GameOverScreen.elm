module GameOverScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)


gameOverScreen : Html Msg
gameOverScreen =
    div [ class "gameScreen" ]
        [ img
            [ class "gameScreen__image"
            , src "images/game_over.png"
            ]
            []
        , div [ class "gameScreen__playScreenClicks" ]
            [ text ((toString 9) ++ "!") ]
        , div [ class "gameScreen__victoryMessage" ]
            [ text "Have a trophy." ]
        , button
            [ class "gameScreen__button"
            , onClick GameScreenClicked
            ]
            [ text "Again?" ]
        ]
