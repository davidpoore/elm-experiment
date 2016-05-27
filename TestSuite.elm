module TestSuite exposing (..)

import ElmTest exposing (..)
import Game exposing (..)
import TitleScreen exposing (..)
import PlayScreen exposing (..)
import GameOverScreen exposing (..)
import GameState exposing (..)


allTests : Test
allTests =
    suite "tests" [ testClickCount, testStartClick, testGameOver, testNewGame ]


testStartClick : Test
testStartClick =
    let
        initialModel =
            fst Game.init

        expectedScreen =
            playScreen { initialModel | clickCount = 1 }

        actualScreen =
            (fst (Game.update GameScreenClicked initialModel)).gameScreen
    in
        test "changes gameScreen to playScreen when titleScreen is clicked"
            (assertEqual expectedScreen actualScreen)


testClickCount : Test
testClickCount =
    let
        initialModel =
            fst Game.init

        updatedModel =
            fst (Game.update GameScreenClicked initialModel)

        actualModel =
            fst (Game.update GameScreenClicked updatedModel)
    in
        test "playScreen increments clickCount when clicked"
            (assertEqual 2 actualModel.clickCount)


testGameOver : Test
testGameOver =
    let
        initialModel =
            fst Game.init

        expectedModel =
            { initialModel | gameScreen = gameOverScreen, clickCount = 9 }

        updatedModel =
            { initialModel | gameScreen = playScreen initialModel, clickCount = 8 }

        actualModel =
            (fst (Game.update GameScreenClicked updatedModel))
    in
        test "changes to gameOverScreen when clicked 9 times"
            (assertEqual expectedModel actualModel)


testNewGame : Test
testNewGame =
    let
        initialModel =
            fst Game.init

        expectedModel =
            { initialModel | gameScreen = titleScreen, clickCount = 0 }

        updatedModel =
            { initialModel | gameScreen = playScreen initialModel, clickCount = 9 }

        actualModel =
            (fst (Game.update GameScreenClicked updatedModel))
    in
        test "returns to titleScreen"
            (assertEqual expectedModel actualModel)


main =
    runSuite allTests
