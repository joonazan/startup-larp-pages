module Frontpage exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Classes exposing (class, Classes(..))
import Message exposing (Message(..))

import Array

{-
    Kuva metsästä: "Not actual in-game footage."
    Taustakuvina stock foto, kuva pörssistä, kuva kepistä, kuva kanaliemestä
    kaavioita, missä näkyy esim. myyntiluvut (palkit pitempiä Macrohardilla, mutta numerot pienempiä)
-}

view model =
    div []
        [ nav <| Tuple.first model
        , content model
        ]

nav : Int -> Html Message
nav selected =
    let
        navLink i name =
            div
                (onClick (Navigation i) :: if i == selected then [class [Selected]] else [])
                [text name]
    in
        Array.toList sivut
        |> List.map Tuple.first
        |> List.indexedMap navLink
        |> div [class [Nav]]

content (nykyinen, edellinen) =
    div [class [Content]]
        [ getPage nykyinen
        ]

getPage p =
    Array.get p sivut
    |> Maybe.map Tuple.second
    |> Maybe.withDefault (text "")

etusivu =
    div []
        [ h1 [class [Logo]] [text "MacroHard"]
        , p []
            [text "MacroHard tekee genrenmäärittäviä next-gen First-person MMO RTS -ratkaisuja."]
        ]

sivut =
    Array.fromList
    [ ("Home", etusivu)
    , ("Vision", visio)
    , ("Playable characters", characters)
    ]

visio =
    div []
        [ p []
            [ text """
Meistä koodaaminen on tosi siistiä, raivostuttavaa, mahtavaa ja tylsää.
Haluamme tarjota kokemuksen siitä myös niille, jotka eivät ole koskaan koodanneet.
"""]
        , p []
            [ text """
Peli ei ole edularp, eikä meillä ole ajatuksena, että peliin osallistuttuasi tiedät,
mitä ovat silmukka ja ehtolauseke. Sen sijaan ideaalisessa tapauksessa pelin jälkeen ymmärrät,
miksi joku on niin innoissaan koodaamisesta,
miksi koodarit valittavat, etteivät osaa koodata ja olet saanut kokea start-up-maailman pöhinää.
Jos pelkäät tietokoneita, uskot olevasi huono matikassa ja ajattelet,
ettet koskaan voisi osata koodata, on tämä peli tarkoitettu juuri sinulle.
"""]
        , p []
            [ text """
Annamme sinulle mahdollisuuden lähestyä näitä aiheita sellaisen ihmisen näkökulmasta,
jonka käsitys omista kyvyistään voi olla kovin erilainen – tai sitten ei,
sillä moni ammattilainenkin tuntee usein itsensä huonoksi ja epävarmaksi.
"""]
        ]

characters =
    div []
    []