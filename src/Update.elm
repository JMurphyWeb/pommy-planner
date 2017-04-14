module Update exposing (..)

import Msgs exposing (Msg(..))
import Models exposing (..)


-- update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    AddPommy ->
      let
        newId = List.length model.tasks
        pommy = Models.new_pommy newId
      in
        ({ model | tasks = model.tasks ++ (List.singleton pommy) }, Cmd.none)

    AddTask ->
      let
        newId = List.length model.tasks
        t = model.new_task
        task = Task t.title t.duration newId
        new_task = Task "" 0 0
      in
        ({ model | new_task = new_task, tasks = model.tasks ++ (List.singleton task) }, Cmd.none)

    Title title ->
      let
        prev_task = model.new_task
        new_task = { prev_task | title = title }
      in
      ({ model | new_task = new_task}, Cmd.none)

    Duration mins_string ->
      let
        duration = String.toInt mins_string |> Result.toMaybe |> Maybe.withDefault 0
        prev_task = model.new_task
        new_task = { prev_task | duration = duration }
      in
      ({ model | new_task = new_task}, Cmd.none)
