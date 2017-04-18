module Main exposing (main)

import Html
import Frontpage

main =
    Html.program
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = Frontpage.view
        }

init =
    (0, Cmd.none)

update msg model =
    (0, Cmd.none)
