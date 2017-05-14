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

  | Horflip

  | Nav
  | Selected

  | Content

  | Logo

  | Pallero
  | Ikoni

  | BigImage
  | Caption

type Ids
  = Asd