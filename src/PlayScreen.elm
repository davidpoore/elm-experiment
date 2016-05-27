module PlayScreen exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import GameState exposing (..)
import Random exposing (..)


playScreen : GameState -> Html Msg
playScreen model =
    div [ class "gameScreen" ]
        [ img
            [ class "gameScreen__image"
            , src "images/game_started.png"
            ]
            []
        , button
            [ class "gameScreen__button"
            , onClick GameScreenClicked
            ]
            [ text "CLICK HERE!!!" ]
        , div [ class "gameScreen__playScreenClicks" ]
            [ text (countEmUp model.clickCount) ]
        ]


countEmUp : Int -> String
countEmUp clicks =
    (List.foldr (++) "" (List.map appendSpaceAndStringify [1..clicks]))


appendSpaceAndStringify : Int -> String
appendSpaceAndStringify num =
    (toString num) ++ " "
