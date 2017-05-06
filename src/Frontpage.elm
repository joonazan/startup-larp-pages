module Frontpage exposing (view)

import Html exposing (..)
import Classes exposing (class, Classes(..))

view model =
    div [class [Flip]]
        [ div [class [Front]]
            [ h1 [] [ text "Otsikko" ]
            , p [] [ text "Korppi tuottaa rikastettuja palveluita tuodakseen käyttäjän lähemmäs tuotetta." ]
            ]
        , h1 [class [Back]] [ text "Otsikko2"]
        ]

{-
    MacroHard tekee genrenmäärittäviä seuraavan sukupolven First-person MMO RTS -ratkaisuja.
    Kuva metsästä: "Not actual in-game footage."
    Taustakuvina stock foto, kuva pörssistä, kuva kepistä, kuva kanaliemestä
    kaavioita, missä näkyy esim. myyntiluvut (palkit pitempiä Macrohardilla, mutta numerot pienempiä)
-}