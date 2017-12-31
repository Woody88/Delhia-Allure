module Page.Home exposing (Model, Msg, init, update, view)

{-| The homepage. You can get here via either the / or /#/ routes.
-}

import Data.Session as Session exposing (Session)
import Html exposing (..)
import Html.Attributes exposing (..)
import Page.Errored as Errored exposing (PageLoadError, pageLoadError)
import Views.Page as Page
import Views.ProductCard as ProductCard exposing (productCard, productContainer)
import Task exposing (Task, succeed)


type alias Model =
    { s : String
    }


init : Session -> Task PageLoadError Model
init session =
    let
        myFunc str =
            { s = str }

        handleLoadError _ =
            pageLoadError Page.Home "Homepage is currently unavailable."
    in
        Task.map Model ("init Home" |> succeed)
            |> Task.mapError handleLoadError



-- VIEW --


view : Session -> Model -> Html Msg
view session model =
    div [ class "home-page container" ]
        [ imageSlider
        , productBanner
        , productContainer
        ]


productBanner =
    div [ class "product-banner" ]
        [ div [ class "tabs" ]
            [ ul [ class "has-text-centered" ]
                [ li [ class "is-active" ]
                    [ a []
                        [ text "New Arrivals" ]
                    ]
                , li []
                    [ a []
                        [ text "Popular" ]
                    ]
                ]
            ]
        ]


imageSlider =
    div [ class "carousel slider" ]
        [ div [ class "carousel-container" ]
            [ div [ class "carousel-content carousel-animate carousel-animate-slide" ]
                [ div [ class "carousel-item" ]
                    [ img [ alt "", class "is-background", attribute "height" "310", src "https://wikiki.github.io/images/merry-christmas.jpg", attribute "width" "640" ]
                        []
                    , div [ class "title" ]
                        [ text "Merry Christmas" ]
                    ]
                , div [ class "carousel-item" ]
                    [ img [ alt "", class "is-background", attribute "height" "310", src "https://wikiki.github.io/images/singer.jpg", attribute "width" "640" ]
                        []
                    , div [ class "title" ]
                        [ text "Original Gift: Offer a song with "
                        , a [ href "https://lasongbox.com", target "_blank" ]
                            [ text "La Song Box" ]
                        ]
                    ]
                , div [ class "carousel-item" ]
                    [ img [ alt "", class "is-background", attribute "height" "310", src "https://wikiki.github.io/images/sushi.jpg", attribute "width" "640" ]
                        []
                    , div [ class "title" ]
                        [ text "Sushi time" ]
                    ]
                , div [ class "carousel-item" ]
                    [ img [ alt "", class "is-background", attribute "height" "310", src "https://wikiki.github.io/images/life.jpg", attribute "width" "640" ]
                        []
                    , div [ class "title" ]
                        [ text "Life" ]
                    ]
                ]
            , div [ class "carousel-nav-left" ]
                [ i [ attribute "aria-hidden" "true", class "fa fa-chevron-left" ]
                    []
                ]
            , div [ class "carousel-nav-right" ]
                [ i [ attribute "aria-hidden" "true", class "fa fa-chevron-right" ]
                    []
                ]
            ]
        ]



-- UPDATE --


type Msg
    = NoOp


update : Session -> Msg -> Model -> ( Model, Cmd Msg )
update session msg model =
    case msg of
        NoOp ->
            model ! []
