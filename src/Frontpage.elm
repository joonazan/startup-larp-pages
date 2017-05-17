module Frontpage exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src, width, href)
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
                    "/img/018-computer.svg"
                    "Koe start-up-yrityksen koodarin tai graafikon elämää, vaikka et oikeasti ole koodari etkä graafikko"
                , pallero
                    "/img/043-idea.svg"
                    "Suunnittele hahmoasi yhdessä pelinjohdon kanssa"
                , pallero
                    "/img/023-browser.svg"
                    "Toteuta in-game-peliprojektia koodaamalla tai piirtämällä"
                , pallero
                    "/img/027-cube.svg"
                    "Eläydy realistiseen nykymaailman ihmiseen, jonka kiinnostukset ja taidot eroavat omistasi"
                ]
            , div [class [Back]]
                [ pallero
                    "/img/021-wise.svg"
                    "Ei valmiita hahmoja"
                , pallero
                    "/img/026-patch.svg"
                    "Ei yliluonnollisia kykyjä ja käsittämättömiä käänteitä"
                ]
            ]
        ]

pallero kuva teksti =
    div [class [Pallero]]

    -- image is wrapped in div to work around webkit horizontal size bug
    [ div []
        [ img
            [ src kuva
            , class [Ikoni]
            ]
            []
        ]

    , p [] [text teksti]
    ]

sivut =
    Array.fromList
    [ ("Home", etusivu)
    , ("Vision", visio)
    , ("Story", story)
    , ("Features", themes)
    , ("Characters", characters)
    , ("About", about)
    , ("Join us!", ilmo)
    , ("Credits", credits)
    ]

kappale x =
    p [] [text x]

visio =
    div []
        [ img
            [ src "/img/vision.jpg"
            , class [BigImage]
            ]
            []
        , kappale """
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
    [ img
        [ src "/img/DOF.jpg"
        , class [BigImage]
        ]
        []
    , p [class [Caption]] [text "Not actual in-game footage"]
    , kappale """
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
    , kappale """
Peliin tarvittavat propit löytyvät varmasti omasta tai kaverien vaatekaapista. Hahmon tyylistä ja luonteesta riippuen voit pukeutua huppariin, kauluspaitaan, mekkoon, nörtti-t-paitaan, hijabiin tai jakkuun. Halutessasi hahmo voi edustaa vaikka goottityyliä, firmassa ei ole pukukoodia, joten kaikki Helsingin kaduilla vastaan tuleva kelpaa.
"""
    ]

about =
    div []
    [ ul [] <|
        List.map (\(x, y)-> li [] [span[][text x], text y])
        [ ("MITÄ", "Start-up-aiheinen liveroolipeli")
        , ("MISSÄ", "Futurice, Annankatu 34B, Helsinki")
        , ("MILLOIN", "Peli tiistaina 4.7.2017 klo 15 – 23 (briiffeineen), lisäksi on suositeltavaa osallistua pelaajatapaamiseen tiistaina 20.6.")
        , ("MITÄ MAKSAA", "pelimaksu 5e + pitsan tms. hinta")
        , ("KENELLE", "innokkaalle liveroolipelaajalle ennakkotiedoista ja -taidoista riippumatta")
        , ("KYSY LISÄÄ", "aetapelinjohto@gmail.com")
        ]
    , kappale """
Start-up-larppi on tarkoitettu sellaisille pelaajille, jotka eivät ole koskaan koodanneet – tai korkeintaan hyvin vähän – mutta jotka haluavat päästä kokemaan pelifirman työntekijän maailmaa ja koodaamisen iloa ja tuskaa. Peliin voidaan ottaa mukaan myös koodaustaitoisia pelaajia, mutta he pelaavat lähtökohtaisesti muita kuin koodareita. Tällä tavoin annetaan lisää tilaa ja liikkumavapautta alkujaan koodaustaidottomille pelaajille, ja lisäksi koodauksen mallintaminen saattaa tuntua kokeneesta koodarista tylsältä. (Jos nyt kuitenkin olet koodari ja haluat ehdottomasti pelata koodaria, ilmoa silti ja tarkenna ilmoittautumisen yhteydessä, miksi juuri tämä kiinnostaa!)
"""
    , kappale """
Pelin koodaamista mallinnetaan pelissä ohjelmoimalla visuaalisella ohjelmointikielellä Scratchilla, joka on kehitetty opetustarkoitukseen. Ennen peliä pidetään illalla 20.6. pelaajatapaaminen, jossa pelinjohto opastaa Scratchin käyttöön. Jos et pääse pelaajatapaamiseen, saa opetteluun apua myös etänä. Opettelusta ei kannata ottaa paineita, sillä oikeasti pelissä toteutettavat jutut ovat varsin yksinkertaisia, ja se, ettei jokin onnistu, kuuluu osana myös huippukoodarihahmojen pelikokemukseen.
"""
    , kappale """
Pelin hahmoja kehitetään pelinjohdon kirjoittaman lyhytkuvauksen pohjalta yhteistyössä pelinjohdon kanssa. Omat ideat hahmon kehittämiseen ovat tervetulleita jo ilmoittautumisvaiheessa! Toivomme lisäksi, että pelaajat käyttävät ainakin jonkin verran aikaa ennen peliä ingame somessa, eli siis käytännössä esim. chattaavat keskenään hahmoinaan. Pelinjohto neuvoo sekä hahmojen teossa että somen kanssa alkuun pääsemisessä tarvittaessa.
"""
    , kappale """
Pelipaikka ei ole täysin esteetön - kysy tarkennusta tarvittaessa pelinjohdolta! Näkövammaisten pelaajien tapauksessa mietitään sopiva vaihtoehto visuaalisen ohjelmointikielen käytölle. Pelin ikäraja on pehmeä 18, eli alaikäisten pelaajien toivotaan ottavan yhteyttä pelinjohtoon. Emme halua sulkea ketään kategorisesti pelin ulkopuolelle, joten jos jokin asia voisi hankaloittaa osallistumistasi, mietitään yhdessä, miten se ratkeaa!
"""
    , kappale """
Pelissä noudatetaan Suomen lakia ja yleisiä hyviä tapoja, tarkemmat säännöt tiedotetaan pelaajille ennen pelin alkua. Tarjolla on myös off-tila, johon voi tulla pitämään taukoa pelaamisesta halutessaan.
"""
    ]

ilmo =
    div []
    [ kappale """
Pelin ilmoittautumisaika on 17.5–31.5. Lomake ei lähetä erillistä vahvistusviestiä,
kysy sähköpostilla jos pelkäät, ettei ilmoittautumisesi ole tullut perille.
Hahmojako tehdään viimeistään 4.6.
"""
    , p [] [a
            [href "https://docs.google.com/forms/d/e/1FAIpQLSfOyYPdE_HA_ciCBiIM2LEndrDbsOZDJANU4_PyBcYRVLpQEg/viewform"]
            [text "Ilmoittautumislomake"]
        ]
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
    , img [src "/img/stock.jpg"] []
    , kappale """
Larpin sivut on tehnyt Joonatan Saarhelo. Sivuja ei kannata ottaa kovin vakavissaan. Älkää ainakaan tehkö samanlaisia animaatioita omiin sivuihinne.
"""
    , kappale """
Sivuilla käytetyt ikonit ovat peräisin sivulta flaticon.com. Ne on tehnyt käyttäjä Freepik.
"""
    ]

themes =
    div []
    [ img
        [ src "/img/market.jpg"
        , class [BigImage]
        ]
        []
    , kappale "Tästä listasta voit poimia inspiraatiota hahmoosi. Lista ei ole millään lailla kattava, vaan tarkoitettu mielikuvituksen herättelijäksi. Mieti, millä tavalla kiinnostavat teemat olisivat voineet vaikuttaa hahmosi elämään, kiinnostuksen kohteisiin, työskentelytapoihin ja persoonaan."
    , h2 [] [text "Ammattilaisten monet koulukunnat"]
    , kappale "Monen koodarin mielestä jokin ohjelmointityyli tai –kieli on selkeästi parempi kuin muut. Myös tietyntyyppiset ongelmat tai tehtävät voivat olla joko kiinnostavia ja haastavia tai tylsiä ja työläitä, ohjelmoijan taustasta riippuen. Myös graafikko- ja muusikkohahmot voivat pitää koulukunta-ajattelua joko typeränä tai puolustaa hanakasti omaa koulukuntaansa. (Pelinjohto auttaa tarvittaessa keksimään hahmon tyyliin ja mieltymyksiin soveltuvan koulukunnan.)"
    , h2 [] [text "Koulutus vs. oikea kompetenssi"]
    , kappale "It-alalla työskentelee sekä pitkälle koulutettuja että itseoppineita osaajia. Kuinka he suhtautuvat toisiinsa? Mitä jos joku osaa paremmin ne asiat, jotka juuri sinun pitäisi osata - paperilla tai omasta mielestäsi? Keneltä voi kysyä neuvoa, entä jos muut kuvittelevat ettei minusta ole mihinkään?"
    , h2 [] [text "Sukupuolivähemmistöt it-alalla"]
    , kappale "Niin koodareista kuin muistakin it-alalla työskentelevistä valtaosa on miehiä. Aiheesta puhutaan niin paljon, että hahmosi ei todennäköisesti ole voinut välttyä kuulemasta keskustelua siitä, miten it-alalle saataisiin enemmän naisia. Onko sukupuolella väliä?"
    , h2 [] [text "Ulkomaalaisuus, kansainvälisyys ja rasismi"]
    , kappale "Ei-suomalainen työntekijä on it-alan yrityksessä enemmän sääntö kuin poikkeus, ja monet yritykset pyrkivät nostamaan ulkomaalaisten työntekijöiden osuutta firman väestä. Toisaalta koodareita voi pelottaa työpaikkojen katoaminen halvemman työvoiman maihin kuten Intiaan – eihän siellä edes osata koodata, vai mitä?"
    , h2 [] [text "Humanistit vs. luonnontieteilijät"]
    , kappale "Luultavasti hahmo on joutunut jossain vaiheessa elämäänsä ottamaan kantaa siihen, suuntautuuko humanistiselle vai luonnontieteelliselle puolelle. Hahmo voi tuntea ylpeyttä omasta alastaan ja väheksyä toisia (”humanistit vain opettelevat ulkoa ja keksivät juttuja mutu-tuntumalta”/ ”luonnontieteilijät tuijottavat vain kylmiä numeroita ihmisen unohtaen”), tai sitten pitää koko vastakkainasettelua typeränä. Ehkä hahmo ei ole löytänyt paikkaansa kummassakaan ryhmässä?"
    , h2 [] [text "Uskonto ja elämänkatsomus"]
    , kappale "Iso osa koodareista on ateisteja, joten uskovainen hahmo saattaa kokea joutuneensa vähemmistöön tai jopa kokea tarvetta piilottaa uskontonsa. Millainen suhde logiikan, järjestelmällisyyden ja koneiden kanssa työskentelevällä on uskontoonsa? Millaista on olla (tai ainakin luulla olevansa) porukan ainoa uskovainen?"
    , h2 [] [text "Perheelliset, seurustelevat ja sinkut"]
    , kappale "Start-up-elämä vaatii paljon paitsi työntekijöiltä, myös näiden perheiltä. On vaikeaa joustaa aikatauluista töiden takia, jos lapsi on haettava päiväkodista tai kuljetettava harrastuksiin. Toisaalta jollekulle työt ovat pakokeino hankalan tuntuisesta perhetilanteesta. Myös seurustelu voi olla tärkeä osa hahmon elämää, ja lapsuudenperhe, sukulaiset ja ystävät tuovat elämään ihmissuhteita. Jotkut hahmot voivat olla yksinäisiä ja surra ystävien, seurustelukumppanin ja jälkikasvun puutetta. Stereotypia sosiaalisesti lahjattomasta, tyttöystävää kaipaavasta heteromieskoodarista elää."
    , h2 [] [text "Työyhteisön sisäiset ristiriidat"]
    , kappale "Pitkää päivää tekevä porukka on paljon keskenään, eikä yhteistyö ole aina saumatonta. On sekä pieniä asioita - miksei kukaan koskaan tiskaa - että isompia: miten on mahdollista, että kaikki uuden pelin koodi on kadonnut? Selittääkö guru ihan omiaan, vai onko hän tosiaan talon paras koodari? Osa porukkaa luottaa firmaan ja toisiinsa vahvasti, mutta kaikki eivät välttämättä. Mitä kaikkea voi sanoa ääneen?"
    ]

characters =
    div []
    [ p []
        [ text "Hahmojen hahmottamisessa auttaa "
        , span [class [Link], onClick (Navigation 3)][text "teemalista"]
        , text "."
        ]
    , h2 [] [text "Koodari, ”ihmelapsi” T."]
    , kappale "Tavallaan harmi, että Päivölästä valmistutaan kahdessa vuodessa: viimeisenä lukiovuonaan 17-vuotias T. voitti suomalaisen Datatähti-ohjelmointikilpailun ja menestyi hyvin myös kansainvälisessä lukiotason International Olympiad of Informatics-kisassa. Nyt ylioppilas on ulkona niin lukion kuin yliopistonkin kilpailuista, sillä T. tuli suoraan Päivölästä töihin MacroHardiin. Oppiminen kiinnostaa T:tä, mutta opiskelun hän ei usko siihen auttavan. Yliopistojen fukseille tarjoamat kurssit vaikuttavat ylihelpoilta, ja tässä työssä parhaiten oppii itse tekemällä, ei kirjaa lukemalla. T. on kiinnostunut algoritmeista, konekielestä ja ohjelmointikielten filosofiasta, ja vaikka hänen työpanoksensa onkin tärkeää koodin nopeuden ja muistinkulutuksen hallinnassa, on iso osa työstä kuitenkin pelkkää perusohjelmointia."
    , h2 [] [text "Koodari, graafinen suunnittelija S."]
    , kappale "S. palkattiin MacroHardiin alun perin siksi, että hän pystyisi varsinaisen graafikon toimensa ohella myös toisinaan auttamaan ohjelmoinnissa. Olihan etenkin web-koodaus hänelle jossakin määrin tuttua, ja näin pienessä firmassa kaikkien täytyy tehdä vähän kaikkea. Gamemen logon suunniteltuaan S. ei ole kuitenkaan juuri tehnyt oman alansa töitä, vaan lähinnä toiminut ohjelmoijana. S. on edelleen tarkka siitä, että kehitettävien pelien visuaaliset elementit ovat toimivia, ja myös ohjelmakoodin selkeys ja luettavuus on hänelle tärkeä asia. S. on ollut mukana miettimässä myös toimiston visuaalista ilmettä ja toimivuutta. Ei ole salaisuus, että S:n mielestä on epäreilua, että K. palkattiin graafikoksi, kun talosta olisi löytynyt tutkinnonkin suorittanut henkilö."
    , h2 [] [text "Graafikko, kuvataideharrastaja K."]
    , kappale "K:lla ei ole tutkintoa kuvataiteesta – vanhemmat eivät päästäneet K:ta edes kuvislukioon, koska se olisi vaatinut muuttoa pois pieneltä kotipaikkakunnalta – mutta hänen DeviantArt-profiilinsa puhuu puolestaan. K:n vanhemmat eivät vieläkään täysin ymmärrä, miten piirtelystä maksetaan palkkaa, mutta toimitusjohtaja on sen sijaan ollut K:n suunnittelemista hahmoista innoissaan. Työhön kuuluu tosin myös vähemmän hohdokasta visuaalisen ilmeen miettimistä. K:n tehtävänä on esimerkiksi tarkistaa markkinointivastaava E:n tuottaman materiaalin tyyli."
    , h2 [] [text "Koodari, Nokia-konkari A."]
    , kappale "A. on firman kokenein koodari. Kahden vuosikymmenen aikana A. sai nähdä Nokian nousun ja tuhon, ja on massairtisanomisissa työpaikkansa menetettyään työskennellyt lyhyempiä pätkiä monissa alan yrityksissä. A:ta kiehtoo start-up-maailman antama mahdollisuus tehdä asiat omalla tavallaan, ja hänen työtapansa ovatkin aika erilaiset verrattuna nuoriin, itseoppineisiin kollegoihin. A. neuvoo muita mielellään, ja vaikka muut eivät aina neuvoja noudata, tietää A. itse olevansa firmalle kullanarvoinen pitkällä kokemuksellaan."
    , h2 [] [text "Media-alan harjoittelija D."]
    , kappale "D. opiskelee media-alaa ammattikorkeakoulussa ja on suorittamassa pakollista tutkintoon kuuluvaa harjoittelua Macrohardissa. Kavereille D. kehuu mielellään päässeensä osaksi start-up-maailman jännittävää ja innokasta meininkiä, mutta itse työnteko tuntuu usein aika vaikealta. Toisaalta D. on ylpeä siitä vastuusta, jota yrityksessä on hänelle annettu. Vain muutaman koulun ohjelmointikurssin perusteella hänet on päästetty tekemään oikeaa koodaustyötäkin. Isona D. ei kuitenkaan halua ohjelmoijaksi, vaan viestintä on lähempänä hänen sydäntään. Onneksi myös markkinointipuolen E. on antanut hänelle tehtävää harjoittelun aikana."
    , h2 [] [text "Markkinointivastaava E."]
    , kappale "E:n vastuulla on yrityksen viestintä ja markkinointi. E. tekee ihan kaikkea: yritysviestintää, some-tilien päivityksiä, mainosvideoita ja harvoihin asiakkaiden yhteydenottoihin vastaamista. E. alkoi kiinnostua it-alasta jo edellisessä työpaikassaan opetushallituksen viestintäyksikössä, kun hänelle annettiin tehtäväksi suunnitella eri ryhmille suunnattuja tiedotteita ohjelmoinnin ottamisesta perusopetuksen piiriin. Parasta Macrohardissa työskentelyssä onkin ollut se, että ohjelmoijien työtä pääsee seuraamaan ihan vierestä, koska yritys on niin pieni. Koodarit tuntuvat mielellään myös puhuvan ohjelmoinnista, etenkin kokenut A. sekä nuori ja innokas T. E. on oppinut heiltä jo paljon."
    , h2 [] [text "Nuori lehtori C."]
    , kappale "C. on halunnut pienestä pitäen professoriksi ja valmistuikin maisteriksi ennätysajassa. Jatko-opinnotkin sujuivat, ja akateemisen pätkätyöläisen ura on lähtenyt hyvin käyntiin. Akateeminen maailma on kuitenkin raskas ja työntäyteinen, ja C. päätti ottaa aikalisän ja kokeilla jotakin aivan muuta. Vaikka hänellä ei ole lainkaan kokemusta kaupallisesta yrityksessä työskentelystä, ei kai se nyt niin vaikeaa voi olla? Omat haasteensa uuteen ympäristöön tottumisessa tuovat kuitenkin myös se, ettei akatemiasta pääsekään niin helposti irti, vaan tutkimusryhmän asioita pitäisi jaksaa hoitaa työpäivän jälkeen, ja perheellekin pitäisi olla joskus aikaa."
    , h2 [] [text "Koodari, kesätyöntekijä, alanvaihtaja N."]
    , kappale "N. päätti reilu vuosi sitten tehdä sen, mitä nykyajan muuttuvassa työelämässä kuulemma vaaditaan: hän vaihtoi alaa, vaikka joutui sitä varten kouluttautumaan uudelleen. N. on kuitenkin nauttinut opiskelusta aikuisiällä: yliopiston luennot eivät tunnu pakolliselta ja tylsältä lisältä nuoruuden juhlimisen joukossa, vaan uuden oppiminen on motivoivaa ja mukavaa. Entisenä historian ja yhteiskuntaopin opettajana N. on nauttinut myös aikuisten seurasta ja itsenäisestä työskentelystä. Joskus häntä kyllä huolestuttaa, miten humanisti voi tällä alalla pärjätä, etenkin, kun hänen oppilaidensa ikäinen T. osaa niin paljon kaikkea, mitä hän ei. Macrohard on N:n ensimmäinen kesätyöpaikka yliopistosta, syksyllä hän aloittaa toisen opintovuoden – jolleivät työt sitten vie mennessään, sillä N. on kuullut, että moni jättää it-alan tutkinnon kesken, kun töitä on tarjolla niin paljon."
    ]