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

    , children
      [ everything
        [ width (pct 100)
        , position absolute
        , backgroundColor (hex "BADA55")
        , property "transition" "2s"
        , transformStyle preserve3d
        , property "backface-visibility" "hidden"
        ]
      ]
    ]

  , class Back
    [ transform <| rotateY (deg 180)
    ]
  ]