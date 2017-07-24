port module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
--import Components.Hello exposing ( hello )


-- APP
main : Program Never Model Msg
main =
  Html.program
    { init = (initialModel, Cmd.none)
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL
type alias Model = String

initialModel : Model
initialModel = "starting string"

-- PORTS


port newComment : (String -> msg) -> Sub msg


--port thumbed : Model -> Cmd msg



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    newComment NewComment

-- UPDATE
type Msg = NoOp | Increment | NewComment String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp -> ( model, Cmd.none)
    Increment ->
        ( model ++ " increment", Cmd.none )
    NewComment comment ->
        ( comment ++ " from NewComment", Cmd.none )


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
    div [ class "jumbotron text-center" ][
      img [ src "static/img/elm.jpg", style styles.img ] []                             -- inline CSS (via var)
      , h1 [] [ text  model ]                                                                     -- ext 'hello' component (takes 'model' as arg)
      , p [] [ text ( "Elm Webpack Starter" ) ]
      , button [ class "btn btn-primary btn-lg", onClick (NewComment "blerp") ] [                  -- click handler
        span[ class "glyphicon glyphicon-star" ][]                                      -- glyphicon
        , span[][ text "FTW!" ]
      ]
    ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img =
      [ ( "width", "33%" )
      , ( "border", "4px solid #337AB7")
      ]
  }