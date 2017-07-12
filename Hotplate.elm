import Html exposing (Html, h1, button, div, text, iframe)
import Html.Events exposing (onClick)
import Html.Attributes exposing(style, attribute)

main =
  Html.beginnerProgram { model = model, view = view, update = update  }

-- MODEL

type alias Model = Float

model : Model
model =
  79.0

-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- VIEW
mainDivStyle : Html.Attribute msg
mainDivStyle =
  style
    [ ("width", "60%") ]

view : Model -> Html Msg
view model =
  div [ mainDivStyle ]
  [ h1 [] [ text "Hotplate" ] 
  , div [] [  
    text "Set point"
    , button [ onClick Decrement  ] [ text "-"  ]
    , div [] [ text (toString model)  ]
    , button [ onClick Increment  ] [ text "+"  ]
    ]
  , iframe ["src", "https://thingspeak.com/channels/190622/charts/1?bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line"] []
  ]
