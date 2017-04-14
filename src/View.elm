module View exposing (..)

import Models exposing (..)
import Msgs exposing (Msg(..))
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)

-- view
view : Model -> Html Msg
view model =
  div []
    [ (renderNewTaskForm model.new_task)
    , a [ class "fl w-10 f6 link dim ba ph3 pv2 mb2 dib black", onClick AddPommy ] [ text "Add Pommy" ]
    , (renderTasks model.tasks)
    ]

renderTasks : List Task -> Html Msg
renderTasks tasks =
  ul [ class "fl w-70" ] (List.map renderTask tasks)

renderTask : Task -> Html Msg
renderTask t =
  li [] [ text t.title, text (toString t.duration) ]

renderNewTaskForm : Task -> Html Msg
renderNewTaskForm new_task =
  let
    duration = if new_task.duration == 0 then ""
      else toString new_task.duration
  in
    div []
      [ input [ class "fl w-10", type_ "text", placeholder "Task title", onInput Title, Html.Attributes.value new_task.title ] []
      , input [ class "fl w-10", type_ "number", placeholder "Task duration", onInput Duration, Html.Attributes.value duration ] []
      , button [ class "fl w-10 f6 link dim ba ph3 pv2 mb2 dib black", onClick AddTask, disabled ((String.isEmpty duration) || (String.isEmpty new_task.title)) ] [ text "Add Task" ]
      ]
