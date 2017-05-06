module Frontpage exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src)
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
        , text "genrenmäärittäviä next-gen First-person MMO RTS -pelejä."
        , div [class [Flip]]
            [ div [class [Front]]
                [ pallero
                    "/svg/018-computer.svg"
                    "Koe start-up-yrityksen koodarin tai graafikon elämää, vaikka et oikeasti ole koodari etkä graafikko"
                , pallero
                    "/svg/043-idea.svg"
                    "Suunnittele hahmoasi yhdessä pelinjohdon kanssa"
                , pallero
                    "/svg/023-browser.svg"
                    "Toteuta in-game-peliprojektia koodaamalla tai piirtämällä"
                , pallero
                    "/svg/027-cube.svg"
                    "Eläydy realistiseen nykymaailman ihmiseen, jonka kiinnostukset ja taidot eroavat omistasi"
                ]
            , div [class [Back]]
                [ pallero
                    "/svg/021-wise.svg"
                    "Ei valmiita hahmoja"
                , pallero
                    "/svg/026-patch.svg"
                    "Ei yliluonnollisia kykyjä ja käsittämättömiä käänteitä"
                ]
            ]
        ]

pallero kuva teksti =
    div [class [Pallero]]
    [ img
        [ src kuva
        , class [Ikoni]
        ]
        []
    , p [] [text teksti]
    ]

sivut =
    Array.fromList
    [ ("Home", etusivu)
    , ("Vision", visio)
    , ("Story", story)
    , ("Characters", characters)
    , ("About", about)
    , ("Join us!", ilmo)
    , ("Credits", credits)
    ]

kappale x =
    p [] [text x]

visio =
    div []
        [ kappale """
Meistä koodaaminen on tosi siistiä, raivostuttavaa, mahtavaa ja tylsää.
Haluamme tarjota kokemuksen siitä myös niille, jotka eivät ole koskaan koodanneet.
"""
        , kappale """
Peli ei ole edularp, eikä meillä ole ajatuksena, että peliin osallistuttuasi tiedät,
mitä ovat silmukka ja ehtolauseke. Sen sijaan ideaalisessa tapauksessa pelin jälkeen ymmärrät,
miksi joku on niin innoissaan koodaamisesta,
miksi koodarit valittavat, etteivät osaa koodata ja olet saanut kokea start-up-maailman pöhinää.
Jos pelkäät tietokoneita, uskot olevasi huono matikassa ja ajattelet,
ettet koskaan voisi osata koodata, on tämä peli tarkoitettu juuri sinulle.
"""
        , kappale """
Annamme sinulle mahdollisuuden lähestyä näitä aiheita sellaisen ihmisen näkökulmasta,
jonka käsitys omista kyvyistään voi olla kovin erilainen – tai sitten ei,
sillä moni ammattilainenkin tuntee usein itsensä huonoksi ja epävarmaksi.
"""
        ]

story =
    div []
    [ kappale """
Vuosi 2017, Helsinki. Pelifirma Macrohardin toimistolla vietetään unetonta yötä.
Koodarien on saatava jotakin kasaan, jotta markkinointipuolen tyypit voivat esitellä
sijoittajille uuden pelin.
"""
    , kappale """
Start-up on haalinut työntekijöikseen monenmoista väkeä. On nuoria itseoppineita koodaajia,
vanhempia kouluja käyneitä ja useita työpaikkoja tunteneita, joku vuorotteluvapaalla
oleva yliopistolehtori sekä graafinen suunnittelija, joka on kuitenkin täällä paneutunut
pelin toteutukseen piirtelyn sijasta. Kaikkia yhdistää panostaminen firman menestykseen,
vaikka tällä hetkellä palkka onkin verrattain huono ja työpäivät pitkiä. Ei kuitenkaan pitäisi
kestää pitkään, että joku saa todella hyvän idean, jonka voi toteuttaa ja joka rikastuttaa
lopulta kaikki. Siihen asti on vain tehtävä töitä, pidettävä yllä tiimihenkeä ja jatkettava
innovointia.
"""
    , kappale """
Peli on nykyaikaista, realistista draamaa. Magiaa, yksisarvisia ja Cthulhun lonkeroita
ei siis ole luvassa, mutta peli on sisällöltään vauhdikkaampi kuin keskimääräinen työpäivä.
Pääpaino on eläytymisessä ja uusissa kokemuksissa, ja joillakin hahmoilla ihmissuhdedraama
on myös keskiössä.
"""
    ]

about =
    div []
    [ kappale """
Start-up-larppi on tarkoitettu sellaisille pelaajille, jotka eivät ole koskaan koodanneet – tai korkeintaan hyvin vähän – mutta jotka haluavat päästä kokemaan pelifirman työntekijän maailmaa ja koodaamisen iloa ja tuskaa. Peliin voidaan ottaa mukaan myös koodaustaitoisia pelaajia, mutta he pelaavat lähtökohtaisesti muita kuin koodareita. Tällä tavoin annetaan lisää tilaa ja liikkumavapautta alkujaan koodaustaidottomille pelaajille, ja lisäksi koodauksen mallintaminen saattaa tuntua kokeneesta koodarista tylsältä. (Jos nyt kuitenkin olet koodari ja haluat ehdottomasti pelata koodaria, ilmoa silti ja tarkenna ilmoittautumisen yhteydessä, miksi juuri tämä kiinnostaa!)
"""
    , kappale """
Pelin koodaamista mallinnetaan pelissä ohjelmoimalla visuaalisella ohjelmointikielellä Scratchilla, joka on kehitetty opetustarkoitukseen. Ennen peliä pidetään illalla 20.6. pelaajatapaaminen, jossa pelinjohto opastaa Scratchin käyttöön. Jos et pääse pelaajatapaamiseen, saa opetteluun apua myös etänä. Opettelusta ei kannata ottaa paineita, sillä oikeasti pelissä toteutettavat jutut ovat varsin yksinkertaisia, ja se, ettei jokin onnistu, kuuluu osana myös huippukoodarihahmojen pelikokemukseen.
"""
    , kappale """
Pelin hahmoja kehitetään pelinjohdon kirjoittaman lyhytkuvauksen pohjalta yhteistyössä pelinjohdon kanssa. Omat ideat hahmon kehittämiseen ovat tervetulleita jo ilmoittautumisvaiheessa!
"""
    , kappale """
Pelipaikka on esteetön (TARKISTA TÄMÄ) ja näkövammaisten pelaajien tapauksessa mietitään sopiva vaihtoehto visuaalisen ohjelmointikielen käytölle. Pelin ikäraja on pehmeä 18 (TARKISTA TÄMÄKIN FUTULTA), eli alaikäisten pelaajien toivotaan ottavan yhteyttä pelinjohtoon.
"""
    , h2 [] [text "Proppautuminen ja välineet"]
    , kappale """
Peliin tarvittavat propit löytyvät varmasti omasta tai kaverien vaatekaapista. Hahmon tyylistä ja luonteesta riippuen voit pukeutua huppariin, kauluspaitaan, mekkoon, nörtti-t-paitaan, hijabiin tai jakkuun. Halutessasi hahmo voi edustaa vaikka goottityyliä, firmassa ei ole pukukoodia, joten kaikki Helsingin kaduilla vastaan tuleva kelpaa.
"""
    , kappale """
Pelissä koodataan Scratch-ympäristössä, joten tarvitset peliin käyttöösi kannettavan tietokoneen, johon on asennettu Adobe Flash, sekä mieluiten hiiren. Jos sinulla ei ole kannettavaa, pelinjohto keksii sinulle sellaisen lainaksi jostakin, kunhan ilmoitat asiasta ajoissa.
"""
    ]

ilmo =
    div []
    [ kappale """
Pelin ilmoittautumisaika on xx-xx. Lomake ei lähetä erillistä vahvistusviestiä,
kysy sähköpostilla jos pelkäät, ettei ilmoittautumisesi ole tullut perille.
Hahmojako tehdään viimeistään xx.
"""
 , kappale """
Hahmojako tehdään anonyymisti, ja mikäli peliin on enemmän tulijoita kuin mahtuu,
pyrimme valitsemaan pelaajia, joiden uskomme saavan pelistä eniten irti
(pelaajan oma kiinnostus, hahmokonseptien sopivuus, ideat hahmon jatkokehitykseen jne).
"""
    ]

credits =
    div []
    [ kappale """
Pelin takana hääräilevät Ada-Maaria Hyvärinen ja Aino Haavisto. Olemme kaksi tietojenkäsittelytieteen opiskelijaa, ja olemme työskennelleet myös Linkki-resurssikeskuksella lasten ja nuorten ohjelmoinnin opetuksessa.
"""
    , kappale """
Ada on lisäksi osa-aikainen tutkimusassari ja Suomen huonoin kisakoodari, Aino aloitti tietokonepelien teon paperille seitsemänvuotiaana ja jatkoi koodaamalla lukiossa. Aikaisemmin olemme järjestäneet yhdessä Toinen retkikunta –larpin maaliskuussa 2017.
"""
    , kappale """
Larppi saa tukea ohjelmistoyritys Futuricelta, jonka tiloissa peli pelataan.
"""
    , kappale """
Larpin sivut on tehnyt Joonatan Saarhelo. Sivuja ei kannata ottaa kovin vakavissaan. Älkää ainakaan tehkö samanlaisia animaatioita omiin sivuihinne.
"""
    , kappale """
Sivuilla käytetyt ikonit ovat peräisin sivulta flaticon.com. Ne on tehnyt käyttäjä Freepik.
"""
    ]

characters =
    div []
    [ h2 [] [text "Koodari, ”ihmelapsi” T."]
    , kappale """
Tavallaan harmi, että Päivölästä valmistutaan kahdessa vuodessa: viimeisenä lukiovuonaan 17-vuotias T. voitti suomalaisen Datatähti-ohjelmointikilpailun ja menestyi hyvin myös kansainvälisessä lukiotason International Olympiad of Informatics-kisassa. Nyt ylioppilas on ulkona niin lukion kuin yliopistonkin kilpailuista, sillä T. tuli suoraan Päivölästä töihin MacroHardiin. Oppiminen kiinnostaa T:tä, mutta opiskelun hän ei usko siihen auttavan. Yliopistojen fukseille tarjoamat kurssit vaikuttavat ylihelpoilta, ja tässä työssä parhaiten oppii itse tekemällä, ei kirjaa lukemalla. T. on kiinnostunut algoritmeista, konekielestä ja ohjelmointikielten filosofiasta, ja vaikka hänen työpanoksensa onkin tärkeää koodin nopeuden ja muistinkulutuksen hallinnassa, on iso osa työstä kuitenkin pelkkää perusohjelmointia.
"""
    , h2 [] [text "Koodari, graafinen suunnittelija S."]
    , kappale """
S. palkattiin MacroHardiin alun perin siksi, että hän pystyisi varsinaisen graafikon toimensa ohella myös toisinaan auttamaan ohjelmoinnissa. Olihan etenkin web-koodaus hänelle jossakin määrin tuttua, ja näin pienessä firmassa kaikkien täytyy tehdä vähän kaikkea. Gamemen logon suunniteltuaan S. ei ole kuitenkaan juuri tehnyt oman alansa töitä, vaan lähinnä toiminut ohjelmoijana. S. on edelleen tarkka siitä, että kehitettävien pelien visuaaliset elementit ovat toimivia, ja myös ohjelmakoodin selkeys ja luettavuus on hänelle tärkeä asia. S. on ollut mukana miettimässä myös toimiston visuaalista ilmettä ja toimivuutta. Ei ole salaisuus, että S:n mielestä on epäreilua, että K. palkattiin graafikoksi, kun talosta olisi löytynyt tutkinnonkin suorittanut henkilö.
"""
    ]