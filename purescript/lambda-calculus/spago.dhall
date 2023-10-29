{ name = "lc"
, dependencies =
  [ "aff"
  , "arrays"
  , "console"
  , "control"
  , "effect"
  , "either"
  , "fixed-points"
  , "foldable-traversable"
  , "identity"
  , "lists"
  , "matryoshka"
  , "maybe"
  , "node-buffer"
  , "node-process"
  , "node-streams"
  , "nonempty"
  , "parsing"
  , "prelude"
  , "psci-support"
  , "refs"
  , "strings"
  , "transformers"
  , "tuples"
  , "unordered-collections"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}