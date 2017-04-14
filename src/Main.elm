module Main exposing (main)

import Msgs exposing (..)
import Models exposing (..)
import Update exposing (update)
import View exposing (view)
import Html


-- init
init =
  ( Model [] (Task "" 0 0)
  , Cmd.none
  )
-- subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- main
main = Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }
