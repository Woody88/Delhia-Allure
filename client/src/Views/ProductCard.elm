module Views.ProductCard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


productContainer =
    div [ class "columns is-multiline" ]
        [ productCard
        , productCard
        , productCard
        , productCard
        , productCard
        , productCard
        , productCard
        ]


productCard =
    div [ class "column is-one-sixth" ]
        [ div [ class "card is-shadowless" ]
            [ div [ class "card-image" ]
                [ figure [ class "image is-2by4" ]
                    [ img [ alt "Placeholder image", src "https://dummyimage.com/600x800&text=dummyimage.com+rocks!" ]
                        []
                    ]
                ]
            , div [ class "card-content has-text-centered" ]
                [ p [] [ text "Product Name" ]
                , p [ class "has-text-weight-semibold" ] [ text "$69.99" ]
                ]
            ]
        ]
