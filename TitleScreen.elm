module TitleScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)


titleScreen : Html Msg
titleScreen =
    div [ onClick GameScreenClicked ]
        [ img [ src "images/title_screen.png" ] []
        , text "I can do it. I will do it nine times."
        ]
