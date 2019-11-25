module Route exposing (Route(..), fromUrl)

import Url exposing (..)
import Url.Parser exposing (..)


type Route
    = Page1
    | Page2 String


parser : Parser (Route -> a) a
parser =
    oneOf
        [ map Page1 top
        , map Page2 (s "order" </> string)
        ]


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    parse parser url
