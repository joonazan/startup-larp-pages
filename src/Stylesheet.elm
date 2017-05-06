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
    , width (px 200)

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
      , backgroundColor (hex "BADA55")
      , property "transition" "2s"
      , transformStyle preserve3d
      , property "backface-visibility" "hidden"
      ]
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
    ]

  , class Content
    [ margin2 (px 0) auto
    , width (px 500)
    , textAlign center
    ]
  ]

allChildren x =
  children
    [everything x]

logoColor =
  hex "#ff6347"