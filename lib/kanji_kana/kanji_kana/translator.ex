defmodule KanjiKana.Translator do
  @moduledoc """
  Provides a function that convert Latin names to katakana or Hiragana
  """
  alias KanjiKana.Letters
  def normalize(text) when is_atom(text), do: normalize(Atom.to_string(text))

  def normalize(text) when is_binary(text) do
    text
    |> String.trim()
    |> String.downcase()
  end

  def normalize(_), do: nil

  def divide(word) do
    word = normalize(word)

    Regex.scan(~r/(?:[aeiouy]|[^aeiouy]+[aeiouy]|[^aeiouy]+$)/, word)
    |> Enum.map(&List.first/1)
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
        add_o(syllable)

      3 ->
        if String.at(syllable, 0) != "n" do
          "tsu" <> String.at(syllable, 1)
        else
          syllable
        end

      _ ->
        syllable
    end

    if String.length(syllable) == 1 do
      add_o(syllable)
    else
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

  defp split_on_consonants(text) do
    Regex.scan(~r/([bcdfghjklmnpqrstvwxyz][^aeiouy]*)/i, text)
    |> Enum.map(&List.first/1)
    |> Enum.intersperse("o")
    |> Enum.join()
  end

  def hiragana(syllable) do
    Letters.hiragana()[syllable]
  end

  def katakana(syllable) do
    Letters.katakana()[syllable]
  end
end
