module Types exposing (..)

import Browser
import Browser.Navigation as Navigation
import Url


type alias Model =
    { key : Navigation.Key
    , url : Url.Url
    }


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
