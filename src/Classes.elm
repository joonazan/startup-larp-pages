module Classes exposing (..)

import Html
import Html.Attributes

import Html.CssHelpers
{ id, class, classList } =
    Html.CssHelpers.withNamespace "main"

type Classes
  = Flip
  | Front
  | Back

  | Nav
  | Selected
  | Logo
  | Content

type Ids
  = Asd