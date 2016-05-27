module GameState exposing (..)

import Html exposing (..)


type Msg
    = GameScreenClicked


type alias GameState =
    { gameScreen : Html Msg
    , clickCount : Int
    }
