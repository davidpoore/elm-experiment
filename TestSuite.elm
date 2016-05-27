module TestSuite exposing (..)

import ElmTest exposing (..)
import Main exposing (..)


allTests : Test
allTests =
    suite "tests" [ testClickCount, testStartClick, testGameOver ]


testClickCount : Test
testClickCount =
    let
        initialModel =
            fst Main.init

        expectedModel =
            { initialModel | clickCount = initialModel.clickCount + 1 }

        updatedModel =
            fst (Main.update StrongBadClicked initialModel)
    in
        test "increments clickCount when a StrongBadClicked message is received"
            (assertEqual expectedModel updatedModel)


testStartClick : Test
testStartClick =
    let
        initialModel =
            fst Main.init

        expectedModel =
            { initialModel | gameState = GameStarted }

        updatedModel =
            fst (Main.update NewGameClicked initialModel)
    in
        test "changes gameState to GameStarted when NewGameclicked message is received"
            (assertEqual expectedModel updatedModel)


testGameOver : Test
testGameOver =
    let
        initialModel =
            fst Main.init

        expectedGameState =
            { initialModel | gameState = GameOver }.gameState

        updatedModel =
            { initialModel | gameState = GameStarted, clickCount = 8 }

        updatedGameState =
            (fst (Main.update StrongBadClicked updatedModel)).gameState
    in
        test "changes gameState to GameOver when StrongBadClicked and click count is 9 or higher"
            (assertEqual expectedGameState updatedGameState)


main =
    runSuite allTests
