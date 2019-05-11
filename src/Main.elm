import Browser
import Html exposing (Html, div)
import Html.Events exposing (onClick)
import Element exposing (..)
import Element.Input as Input
import Element.Border as Border
import Element.Background as BG
import Element.Font as Font

main : Platform.Program () Model Msg
main =
  Browser.sandbox { init = 0, update = update, view = view }


type alias Model = Int

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view : Model -> Html Msg
view model =
    layout [] (element model)


element : Model -> Element Msg
element model =
  let
      backEnabled = model > 0
  in
  row []
    [ column [width (px 100)] [button (if backEnabled then [] else [BG.color (rgb 0.5 0.5 0.5)]) (if backEnabled then (Just Decrement) else Nothing) "-"]
    , column [width (px 50)] [el [centerX] (text (String.fromInt model)) ]
    , column [width (px 100)] [button [alignRight] (Just Increment) "+"]
    ]

button : List (Attribute Msg) -> Maybe Msg -> String -> Element Msg
button attrs msg label =
    Input.button 
        ([BG.color (rgb 0.2 0.2 0.2), Font.color (rgb 1 1 1), padding 10 ] ++ attrs) 
        {onPress = msg, label = text label}
