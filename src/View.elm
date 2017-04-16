module View exposing (..)

import Models exposing (..)
import Msgs exposing (Msg(..))
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)

-- view
view : Model -> Html Msg
view model =
  div [ class "container" ]
    [ taskForm(model)
    , div [ class "time-grid" ] [(renderTasks model.tasks)]
    ]

taskForm : Model -> Html Msg
taskForm model =
  div [ class "task-form" ]
    [ (renderNewTaskForm model.new_task)
    , button [ class "fl w-30 f6 link dim ba ph3 pv2 mb2 dib black", onClick AddPommy ] [ text "Add Pommy" ]
    ]

renderTasks : List Task -> Html Msg
renderTasks tasks =
  ul [ class "" ] (List.map renderTask tasks)

renderTask : Task -> Html Msg
renderTask t =
  li [ class ("task t" ++ toString (t.duration)) ] [ text t.title, text (toString t.duration) ]

renderNewTaskForm : Task -> Html Msg
renderNewTaskForm new_task =
  let
    duration = if new_task.duration == 0 then ""
      else toString new_task.duration
  in
    div []
      [ input [ class "fl w-30", type_ "text", placeholder "Task title", onInput Title, value new_task.title ] []
      , input [ class "fl w-30", type_ "number", placeholder "Task duration", onInput Duration, value duration ] []
      , button [ class "fl w-30 f6 link dim ba ph3 pv2 mb2 dib black", onClick AddTask, disabled ((String.isEmpty duration) || (String.isEmpty new_task.title)) ] [ text "Add Task" ]
      ]
