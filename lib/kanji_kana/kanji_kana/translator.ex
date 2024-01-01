defmodule KanjiKana.Translator do
  @moduledoc """
  Provides a function that convert Latin names to katakana or Hiragana
  """
  alias KanjiKana.Letters
  @spec normalize(String.t()) :: [String.t()]
  def normalize(text) when is_atom(text), do: normalize(Atom.to_string(text))

  def normalize(text) when is_binary(text) do
    text
    |> String.trim()
    |> String.downcase()
    |> String.split()
  end

  def normalize(_), do: []

  def divide(word) do
    Regex.scan(~r/(?:[aeiou]|[^aeiou]+[aeiou]|[^aeiou]+$)/, word)
    |> Enum.map(&List.first/1)
    |> List.flatten()
    |> Enum.map(&split_on_consonants/1)
    |> List.flatten()
  end

  def to_hiragana(text) do
    text
    |> divide()
    |> Enum.map(&adapt_syllable/1)
    |> Enum.map(&handle_silent_h/1)
    |> Enum.map_join(&hiragana/1)
  end

  def to_katakana(text) do
    text
    |> divide()
    |> Enum.map(&adapt_syllable/1)
    |> Enum.map(&handle_silent_h/1)
    |> Enum.map_join(&katakana/1)
  end

  def adapt_syllable(syllable) do
    syllable = remove_duplicates(syllable)

    case String.length(syllable) do
      1 ->
        if syllable == "n" do
          syllable
        else
          add_o(syllable)
        end

      3 ->
        if String.at(syllable, 0) != "n" do
          "tsu" <> String.at(syllable, 1)
        else
          syllable
        end

      _ ->
        syllable
    end
  end

  defp remove_duplicates(text) do
    text
    |> String.graphemes()
    |> Enum.uniq()
    |> Enum.join()
  end

  defp handle_silent_h(syllable) do
    Regex.replace(~r/([bcdfghjklmnpqrstvwxyz])h([aeiouy])/i, syllable, "\\1\\2")
  end

  defp add_o(letter) do
    if letter in ["a", "i", "u", "e", "o", "y"] do
      letter
    else
      letter <> "o"
    end
  end

  @constants [
    "b",
    "c",
    "d",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l",
    "m",
    "n",
    "p",
    "q",
    "r",
    "s",
    "t",
    "v",
    "w",
    "x",
    "z"
  ]

  def split_on_consonants(input_string) do
    input_string
    |> String.graphemes()
    |> Enum.reduce([], fn char, acc ->
      if acc == [] do
        [char]
      else
        handle_stacked_constants(char, acc)
      end
    end)
  end

  defp handle_stacked_constants(char, acc) do
    [prev_char | _] = acc

    if prev_char in @constants and char in @constants and
         char != prev_char do
      acc ++ [char]
    else
      if l = List.last(acc) do
        new_l = l <> char
        acc = acc -- [l]
        acc ++ [new_l]
      else
        acc ++ [char]
      end
    end
  end

  def hiragana(syllable) do
    Letters.hiragana()[syllable]
  end

  def katakana(syllable) do
    Letters.katakana()[syllable]
  end
end
