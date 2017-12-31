module Views.PageLoader exposing (pageloader)

import Html exposing (Attribute, Html, div, li, text, span)
import Html.Attributes exposing (class, style)


pageloader : Html msg
pageloader =
    div [ class "pageloader" ]
        [ span [ class "title" ]
            [ text "Pageloader" ]
        ]
