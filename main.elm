module Main exposing (..)

import Html exposing (..)


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
    ( "Waiting quote", Cmd.none )



-- UDPATE


type Msg
    = Nothing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Nothing ->
            ( "World", Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [] [ text model ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
