module Stylesheet exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (..)

import Classes exposing (Classes(..), Ids(..))

css : Stylesheet
css =
  (stylesheet << namespace "main")
  [ class Flip
    [ property "perspective" "1000px"
    , width (pct 100)
    , height (px 400)
    , marginTop (px 20)

    , hover
      [ children
        [ class Front
          [ transform <| rotateY (deg -180) ]
        , class Back
          [ transform <| rotateY (deg 0) ]
        ]
      ]

    , allChildren
      [ width (pct 100)
      , position absolute
      , property "transition" "0.9s"
      , transformStyle preserve3d
      , property "backface-visibility" "hidden"
      ]
    ]

  , class Front
    [ transform <| rotateY (deg 0) -- support old firefox version
    ]

  , class Back
    [ transform <| rotateY (deg 180)
    ]

  , class Nav
    [ displayFlex
    , justifyContent center
    , fontFamily sansSerif
    , allChildren
      [ margin (px 3)
      , borderBottom3 (px 2) solid (hex "666666")
      , hover
        [ borderBottom3 (px 2) solid logoColor
        ]
      ]
    ]

  , class Selected
    [ borderBottom3 (px 2) solid logoColor
    ]

  , class Logo
    [ color logoColor
    , fontFamilies ["Helvetica"]
    , marginBottom (px 5)
    ]

  , class Content
    [ margin2 (px 0) auto
    , width (px 600)
    , textAlign center
    , fontFamily sansSerif
    ]

  , class Pallero
    [ displayFlex
    , textAlign left
    ]
  , class Ikoni
    [ width (px 80)
    , margin2 (px 5) (px 10)
    ]

  , class BigImage
    [ marginLeft (px -90)
    ]

  , class Caption
    [ fontStyle italic
    ]

  , ul
    [ listStyleType none
    , textAlign left
    , descendants
      [ span
        [ fontWeight bold
        , marginRight (px 7)
        ]
      ]
    ]
  ]

allChildren x =
  children
    [everything x]

logoColor =
  hex "#ff6347"