module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing (..)


type GameState
    = TitleScreen
    | GameStarted
    | GameOver


type alias Model =
    { gameState : GameState
    , clickCount : Int
    }


type Msg
    = NewGameClicked
    | StrongBadClicked


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
        initialModel =
            model

        updatedModel =
            { model | clickCount = model.clickCount + 1 }
    in
        case msg of
            NewGameClicked ->
                ( { initialModel | gameState = GameStarted }, Cmd.none )

            StrongBadClicked ->
                if updatedModel.clickCount >= 9 then
                    ( { updatedModel | gameState = GameOver }, Cmd.none )
                else
                    ( updatedModel, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( { gameState = TitleScreen, clickCount = 0 }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ onClick (gameClick model) ]
        [ text (toString model.gameState) ]


gameClick : Model -> Msg
gameClick model =
    case model.gameState of
        TitleScreen ->
            NewGameClicked

        GameOver ->
            NewGameClicked

        GameStarted ->
            StrongBadClicked
