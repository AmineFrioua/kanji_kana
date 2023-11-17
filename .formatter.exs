# Used by "mix format"
[
  inputs: [
    "{mix,.formatter}.exs",
    "priv/*/seeds.exs",
    "{config,lib,test}/**/*.{ex,exs}"
  ],
  subdirectories: ["priv/*/migrations"],
  line_length: 80
]
