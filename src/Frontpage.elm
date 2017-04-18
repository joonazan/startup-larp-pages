module Frontpage exposing (view)

import Html exposing (..)
import Classes exposing (class, Classes(..))

view model =
    div [class [Flip]]
        [ h1 [class [Front]] [ text "Otsikko" ]
        , h1 [class [Back]] [ text "Otsikko2"]
        ]