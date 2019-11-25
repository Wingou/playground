module Page1.Page1 exposing (view)

import Browser
import Html exposing (Html, div, text)
import Types exposing (..)


view : Model -> Browser.Document Msg
view model =
    { title = "PAGE 1 "
    , body = [ div [] [ text "PAGE 1" ] ]
    }
