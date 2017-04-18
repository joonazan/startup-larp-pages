module Style.Stylesheet exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (..)

import Style.Classes exposing (Classes(..), Ids(..))

css : Stylesheet
css =
  (stylesheet << namespace "main")
  [ class Flip
    [ property "perspective" "1000px"
    , width (pct 100)
    
    , hover
      [ children
        [ class Front
          [ transform <| rotateY (deg 180) ]
        , class Back
          [ transform <| rotateY (deg 0) ]
        ]
      ]

    , children [everything
      [ width (pct 100)
      , property "transition" "0.6s"
      , transformStyle preserve3d
      ]
    ]
    ]

  , class Back
    [ transform <| rotateY (deg 180)
    , position absolute
    ]
  ]