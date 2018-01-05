module Main exposing (..)

import Html exposing (..)
import Http
import Json.Decode as Decode


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    String



-- INIT


init : ( Model, Cmd Msg )
init =
    ( "Waiting quote", getQuote )



-- UDPATE


type Msg
    = Quote (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Quote (Ok quote) ->
            ( "World", Cmd.none )

        Quote (Err _) ->
            ( "Error", Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP


getQuote : Cmd Msg
getQuote =
    let
        url =
            "http://localhost:8888/quote"
    in
        Http.send Quote (Http.get url decodeQuote)


decodeQuote : Decode.Decoder String
decodeQuote =
    Decode.at [ "quote", "author" ] Decode.string
