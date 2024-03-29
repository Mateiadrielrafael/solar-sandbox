let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.0-20210409/packages.dhall sha256:e81c2f2ce790c0e0d79869d22f7a37d16caeb5bd81cfda71d46c58f6199fd33f

let additions =
      { typelevel-lists =
        { dependencies =
          [ "prelude"
          , "tuples"
          , "typelevel-peano"
          , "typelevel-prelude"
          , "unsafe-coerce"
          ]
        , repo = "https://github.com/PureFunctor/purescript-typelevel-lists/"
        , version = "main"
        }
      }

in  upstream // additions
