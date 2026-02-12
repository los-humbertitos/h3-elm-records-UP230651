module Helper exposing (..)

import Html exposing (Html, div, h1, li, text, ul)



-- 1. Funciones Matemáticas


add2 : Int -> Int -> Int
add2 x y =
    x + y



-- OJO: El test usa 'floatRange', así que esta función debe recibir Float


add3 : Float -> Float -> Float -> Float
add3 x y z =
    x + y + z


calc : Int -> Int -> (Int -> Int -> Int) -> Int
calc x y operation =
    operation x y



-- 2. Listas y Records (Registros)
-- Definimos el tipo alias basándonos en 'languageFuzzer'


type alias Language =
    { name : String
    , releaseYear : Int
    , currentVersion : String
    }


languageNames : List Language -> List String
languageNames languages =
    List.map .name languages



-- Definimos el tipo alias basándonos en 'userFuzzer'


type alias User =
    { name : String
    , uType : String
    }


onlyStudents : List User -> List String
onlyStudents users =
    List.map
        (\u ->
            if u.uType == "Student" then
                u.name

            else
                ""
        )
        users



-- Definimos el tipo alias basándonos en 'videogameAliasedFuzzer'


type alias Videogame =
    { title : String
    , releaseYear : Int
    , available : Bool
    , downloads : Int
    , genres : List String
    }


getVideogameGenres : List Videogame -> List (List String)
getVideogameGenres games =
    List.map .genres games



-- 3. HTML y Estructura Principal
-- Necesitamos este record para la variable 'myLaptop' que piden los tests


type alias Laptop =
    { ram : String
    , model : String
    , brand : String
    , screenSize : String
    }



-- Definimos 'myLaptop' con cualquier dato (mientras sean Strings funciona)


myLaptop : Laptop
myLaptop =
    { ram = "16GB"
    , model = "MacBook Pro"
    , brand = "Apple"
    , screenSize = "13 inches"
    }


main : Html msg
main =
    div []
        [ h1 [] [ text "My laptop" ]
        , div []
            [ ul []
                [ li [] [ text ("Ram: " ++ myLaptop.ram) ]
                , li [] [ text ("Modelo: " ++ myLaptop.model) ]
                , li [] [ text ("Marca: " ++ myLaptop.brand) ]
                , li [] [ text ("Pulgadas: " ++ myLaptop.screenSize) ]
                ]
            ]
        ]
