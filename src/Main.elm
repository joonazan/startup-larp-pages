module Main exposing (main)

import Html
import Frontpage
import Message exposing (Message(..))

main =
    Html.program
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = Frontpage.view
        }

init =
    ((0, 0), Cmd.none)

update msg (current, prev) =
    case msg of
        Navigation page ->
            ((page, current), Cmd.none)
