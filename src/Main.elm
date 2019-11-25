module Main exposing (..)

import Browser
import Browser.Navigation as Navigation
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Page1.Page1 exposing (..)
import Page2.Page2 exposing (..)
import Route
import Types exposing (..)
import Url



---- MODEL ----


init : () -> Url.Url -> Navigation.Key -> ( Model, Cmd Msg )
init flag url key =
    case Route.fromUrl url of
        Just Route.Page1 ->
            ( { key = key
              , url = url
              }
            , Cmd.none
            )

        _ ->
            ( { key = key
              , url = url
              }
            , Cmd.none
            )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External url ->
                    ( model
                    , Navigation.load url
                    )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )


pageDefault : Browser.Document Msg
pageDefault =
    { title = "Accueil"
    , body =
        [ div [] [ text "ACCUEIL" ]
        ]
    }


view : Model -> Browser.Document Msg
view model =
    case Route.fromUrl model.url of
        Just Route.Page1 ->
            Page1.Page1.view model

        Just (Route.Page2 order) ->
            Page2.Page2.view model order

        Nothing ->
            pageDefault


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
