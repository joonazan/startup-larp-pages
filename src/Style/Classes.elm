module Style.Classes exposing (..)

import Html
import Html.Attributes

import Html.CssHelpers
{ id, class, classList } =
    Html.CssHelpers.withNamespace "main"

type Classes
  = Flip
  | Front
  | Back

type Ids
  = Asd