module Main exposing (..)

import Html exposing (Html, button, div, p, strong, text)
import Html.Attributes exposing (style)
import Http
import Json.Decode exposing (Decoder, at, int, map3, string)
import Time
import Random


-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- TYPES


type alias Post =
    { id : Int
    , title : String
    , body : String
    }



-- MODEL


type alias Model =
    { posts : List Post
    }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { posts = [] }
    , getRandomInt
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (2 * Time.second) Interval



-- UPDATE


type Msg
    = UseRandomInt Int
    | Interval Time.Time
    | HttpCallback (Result Http.Error Post)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Interval _ ->
            ( model, getRandomInt )

        UseRandomInt int ->
            ( model, getPost int )

        HttpCallback res ->
            case res of
                Ok post ->
                    let
                        updatedPosts =
                            (post :: model.posts)
                    in
                        ( { model | posts = updatedPosts }, Cmd.none )

                Err err ->
                    let
                        print =
                            Debug.log "Response Error" (toString err)
                    in
                        ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    let
        postStyle =
            [ ( "max-width", "50vw" )
            , ( "margin", "1em auto" )
            , ( "padding", "1em" )
            , ( "background-color", "lightblue" )
            ]

        posts =
            List.map
                (\post ->
                    div [ style postStyle ]
                        [ p [] [ strong [] [ text "ID: " ], text (toString post.id) ]
                        , p [] [ strong [] [ text "Title: " ], text post.title ]
                        , p [] [ strong [] [ text "Body: " ], text post.body ]
                        ]
                )
                model.posts
    in
        div [] posts



-- ACTIONS


getPost : Int -> Cmd Msg
getPost id =
    let
        url =
            "http://jsonplaceholder.typicode.com/posts/" ++ toString id
    in
        Http.send HttpCallback (Http.get url responseDecoder)


getRandomInt : Cmd Msg
getRandomInt =
    Random.generate UseRandomInt (Random.int 1 99)



-- DECODERS


responseDecoder : Decoder Post
responseDecoder =
    map3 Post
        (at [ "id" ] int)
        (at [ "title" ] string)
        (at [ "body" ] string)
