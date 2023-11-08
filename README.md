# KanjiKana

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kanji_kana` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kanji_kana, "~> 0.1.0"}
  ]
end
```
Then, run mix `deps.get` in your terminal to fetch the dependency.

## Usage
Here's how to use KanjiKana to convert Kanji to other forms:

```elixir
KanjiKana.kanji_to_hiragana("漢字") # Returns the Hiragana representation
KanjiKana.kanji_to_katakana("漢字") # Returns the Katakana representation
KanjiKana.kanji_to_romaji("漢字")   # Returns the Romaji representation
```

## Feature

- Simple API: A clean and easy-to-understand interface that lets you convert text with a single function call.
- Performance: Optimized for fast conversion, suitable for real-time applications.
- Robust: Comes with a comprehensive test suite ensuring reliability and stability.

## Contributing
Contributions are welcome, and they are greatly appreciated! Every little bit helps, and credit will always be given.

You can contribute in many ways:

- Fix bugs.
- Write or improve documentation (fix my typos :<( ).
- Suggest new features.
- Write BETTER tests.



