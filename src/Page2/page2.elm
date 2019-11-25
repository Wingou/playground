module Page2.Page2 exposing (view)

import Browser
import Html exposing (Html, div, text)
import Types exposing (..)


view : Model -> String -> Browser.Document Msg
view model order =
    { title = "PAGE 2 "
    , body =
        [ div []
            [ text ("PAGE 2" ++ order)
            ]
        ]
    }
