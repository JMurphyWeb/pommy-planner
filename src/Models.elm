module Models exposing (..)

-- model
type alias Model =
  { tasks : List Task
  , new_task : Task
  }

-- types
type alias Task =
  { title : String
  , duration : Int
  , id : Int
  }


new_pommy = Task "Pommy" 25
