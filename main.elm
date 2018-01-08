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


type alias Quote =
    { quote : String
    , author : String
    }


type alias Model =
    { quote : Maybe Quote
    , error : Maybe Http.Error
    }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { quote = Nothing
      , error = Nothing
      }
    , getQuote
    )



-- UDPATE


type Msg
    = QuoteUpdate (Result Http.Error Quote)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        QuoteUpdate (Ok quote) ->
            ( { model | quote = Just quote }, Cmd.none )

        QuoteUpdate (Err e) ->
            ( { model | error = Just e }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("Quote : " ++ (toString model.quote)) ]
        , div [] [ text ("Error : " ++ (toString model.error)) ]
        ]



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
        Http.send QuoteUpdate (Http.get url quoteDecoder)



-- decodeQuote : Decode.Decoder (List a)
-- decodeQuote json =
--   Decode.list json


quoteDecoder : Decode.Decoder Quote
quoteDecoder =
    Decode.map2
        Quote
        (Decode.at [ "quote" ] Decode.string)
        (Decode.at [ "author" ] Decode.string)
