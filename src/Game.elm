module Game exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing (..)
import TitleScreen exposing (..)
import PlayScreen exposing (..)
import GameOverScreen exposing (..)
import GameState exposing (..)


type alias Model =
    GameState


main : Program Never
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        updatedModel =
            { model | clickCount = model.clickCount + 1 }
    in
        case msg of
            GameScreenClicked ->
                if updatedModel.clickCount == 1 then
                    ( { updatedModel | gameScreen = playScreen updatedModel }, Cmd.none )
                else if updatedModel.clickCount == 9 then
                    ( { updatedModel | gameScreen = gameOverScreen }, Cmd.none )
                else if updatedModel.clickCount > 9 then
                    ( { updatedModel | gameScreen = titleScreen, clickCount = 0 }, Cmd.none )
                else
                    ( { updatedModel | gameScreen = playScreen updatedModel }, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( { gameScreen = titleScreen
      , clickCount = 0
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div [ class "game" ]
        [ header [ class "game__title" ] [ text "NINE TIMES" ]
        , model.gameScreen
        ]
