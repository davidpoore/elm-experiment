module TitleScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)


titleScreen : Html Msg
titleScreen =
    div [ class "gameScreen" ]
        [ img
            [ class "gameScreen__image"
            , src "images/title_screen.png"
            ]
            []
        , div []
            [ button
                [ class "gameScreen__button"
                , onClick GameScreenClicked
                ]
                [ text "I can do it. I will do it nine times." ]
            , div [] [ text "(click the button to start)" ]
            ]
        ]
