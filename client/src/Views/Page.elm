module Views.Page exposing (ActivePage(..), bodyId, frame)

{-| The frame around a typical page - that is, the header and footer.
-}

import Data.User as User exposing (User, Username)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Lazy exposing (lazy2)
import Route exposing (Route)
import Util exposing ((=>))
import Views.PageLoader exposing (pageloader)


-- import Views.Spinner exposing (spinner)


{-| Determines which navbar link (if any) will be rendered as active.
Note that we don't enumerate every page here, because the navbar doesn't
have links for every page. Anything that's not part of the navbar falls
under Other.
-}
type ActivePage
    = Other
    | Home



-- | Login
-- | Register


{-| Take a page's Html and frame it with a header and footer.
The caller provides the current user, so we can display in either
"signed in" (rendering username) or "signed out" mode.
isLoading is for determining whether we should show a loading spinner
in the header. (This comes up during slow page transitions.)
-}
frame : Bool -> Maybe User -> ActivePage -> Html msg -> Html msg
frame isLoading user page content =
    div [ class "page-frame" ]
        [ pageloader
        , viewHeader page user isLoading
        , content
        , viewFooter
        ]



-- frame : Bool -> Maybe User -> ActivePage -> Html msg -> Html msg
-- frame isLoading user page content =
--     div [ class "page-frame" ]
--         [ viewHeader page user isLoading
--         , content
--         , viewFooter
--         ]
--
--


viewHeader : ActivePage -> Maybe User -> Bool -> Html msg
viewHeader page user isLoading =
    header [ class "container" ]
        [ navBar
        , hr [] []
        , subNavBar
        ]


subNavBar =
    nav [ class "sub-nav level" ]
        [ div [ class "level-left" ]
            [ p [ class "level-item" ]
                [ a []
                    [ text "Products" ]
                ]
            , p [ class "level-item" ]
                [ a []
                    [ text "About" ]
                ]
            , p [ class "level-item" ]
                [ a []
                    [ text "Contact" ]
                ]
            ]
        , div [ class "level-right" ]
            []
        ]


navBar =
    nav [ class "navbar is-transparent navbar-extras" ]
        [ div [ class "navbar-brand" ]
            [ a [ class "navbar-item", href "https://bulma.io" ]
                [ img [ alt "Bulma: a modern CSS framework based on Flexbox", attribute "height" "28", src "https://bulma.io/images/bulma-logo.png", attribute "width" "112" ]
                    []
                ]
            , div [ class "navbar-burger burger", attribute "data-target" "navbarExampleTransparentExample" ]
                [ span []
                    []
                , span []
                    []
                , span []
                    []
                ]
            ]
        , div [ class "navbar-menu", id "navbarExampleTransparentExample" ]
            [ div [ class "navbar-start" ]
                []
            , div [ class "navbar-end nav-header-options" ]
                [ a [ class "navbar-item", href "https://bulma.io/" ]
                    [ text "Sign in" ]
                , div [ class "divider" ] []
                , a [ class "navbar-item", href "https://bulma.io/" ]
                    [ text "Wishlist" ]
                , div [ class "divider" ] []
                , a [ class "navbar-item", href "https://bulma.io/" ]
                    [ text "Cart: 0" ]
                ]
            ]
        ]



-- viewHeader : ActivePage -> Maybe User -> Bool -> Html msg
-- viewHeader page user isLoading =
--     nav [ class "navbar navbar-light" ]
--         [ div [ class "container" ]
--             [ a [ class "navbar-brand", Route.href Route.Home ]
--                 [ text "conduit" ]
--             , ul [ class "nav navbar-nav pull-xs-right" ] <|
--                 lazy2 Util.viewIf isLoading spinner
--                     :: navbarLink page Route.Home [ text "Home" ]
--                     :: viewSignIn page user
--             ]
--         ]
-- viewSignIn : ActivePage -> Maybe User -> List (Html msg)
-- viewSignIn page user =
--     let
--         linkTo =
--             navbarLink page
--     in
--     case user of
--         Nothing ->
--             [ linkTo Route.Login [ text "Sign in" ]
--             , linkTo Route.Register [ text "Sign up" ]
--             ]
--
--         Just user ->
--             [ linkTo Route.NewArticle [ i [ class "ion-compose" ] [], text " New Post" ]
--             , linkTo Route.Settings [ i [ class "ion-gear-a" ] [], text " Settings" ]
--             , linkTo
--                 (Route.Profile user.username)
--                 [ img [ class "user-pic", UserPhoto.src user.image ] []
--                 , User.usernameToHtml user.username
--                 ]
--             , linkTo Route.Logout [ text "Sign out" ]
--             ]
--
--


viewFooter : Html msg
viewFooter =
    footer [ class "footer" ]
        [ div [ class "container" ]
            [ div [ class "content has-text-centered" ]
                [ p []
                    [ strong []
                        [ text "Bulma" ]
                    , text "by "
                    , a [ href "http://jgthms.com" ]
                        [ text "Jeremy Thomas" ]
                    , text ". The source code is licensed        "
                    , a [ href "http://opensource.org/licenses/mit-license.php" ]
                        [ text "MIT" ]
                    , text ". The website content        is licensed "
                    , a [ href "http://creativecommons.org/licenses/by-nc-sa/4.0/" ]
                        [ text "CC BY NC SA 4.0" ]
                    , text ".      "
                    ]
                ]
            ]
        ]



-- navbarLink : ActivePage -> Route -> List (Html msg) -> Html msg
-- navbarLink page route linkContent =
--     li [ classList [ ( "nav-item", True ), ( "active", isActive page route ) ] ]
--         [ a [ class "nav-link", Route.href route ] linkContent ]


isActive : ActivePage -> Route -> Bool
isActive page route =
    case ( page, route ) of
        ( Home, Route.Home ) ->
            True

        -- ( Login, Route.Login ) ->
        --     True
        --
        -- ( Register, Route.Register ) ->
        --     True
        _ ->
            False


{-| This id comes from index.html.
The Feed uses it to scroll to the top of the page (by ID) when switching pages
in the pagination sense.
-}
bodyId : String
bodyId =
    "page-body"
