defmodule KanjiKana do
  @moduledoc """
  Provides functions to convert Kanji characters to their corresponding Hiragana, Katakana, and romaji representations by querying a database.

  ## Examples

      # Assuming the database has been seeded with a Kanji entry for '山田太郎' that has hiragana, katakana, and romaji equivalents
      iex> KanjiKana.kanji_to_hiragana("山田太郎")
      "やまだたろう"

      iex> KanjiKana.kanji_to_katakana("山田太郎")
      "ヤマダタロウ"

      iex> KanjiKana.kanji_to_romaji("山田太郎")
      "Yamada Tarou"
  """

  alias KanjiKana.Repo
  alias KanjiKana.Name

  @doc """
  Converts a Kanji name to its Hiragana representation.

  ## Parameters

    - kanji_name : String.t() - The Kanji name to be converted.

  ## Returns

    - hiragana : String.t() - The Hiragana representation of the given Kanji name.

  ## Examples

      iex> KanjiKana.kanji_to_hiragana("山田太郎")
      "やまだたろう"
  """
  @spec kanji_to_hiragana(String.t()) :: String.t() | nil
  def kanji_to_hiragana(kanji_name) do
    kanji_name = String.trim(kanji_name)
    name = Repo.get_by(Name, kanji: kanji_name)

    if name do
      Map.get(name, :hiragana)
    end
  end

  @doc """
  Converts a Kanji name to its Katakana representation.

  ## Parameters

    - kanji_name : String.t() - The Kanji name to be converted.

  ## Returns

    - katakana : String.t() - The Katakana representation of the given Kanji name.

  ## Examples

      iex> KanjiKana.kanji_to_katakana("山田太郎")
      "ヤマダタロウ"
  """
  @spec kanji_to_katakana(String.t()) :: String.t() | nil
  def kanji_to_katakana(kanji_name) do
    kanji_name = String.trim(kanji_name)
    name = Repo.get_by(Name, kanji: kanji_name)

    if name do
      Map.get(name, :katakana)
    end
  end

  @doc """
  Converts a Kanji name to its romaji representation.

  ## Parameters

    - kanji_name : String.t() - The Kanji name to be converted.

  ## Returns

    - romaji : String.t() - The romaji representation of the given Kanji name.

  ## Examples

      iex> KanjiKana.kanji_to_romaji("山田太郎")
      "Yamada Tarou"
  """
  @spec kanji_to_romaji(String.t()) :: String.t() | nil
  def kanji_to_romaji(kanji_name) do
    kanji_name = String.trim(kanji_name)
    name = Repo.get_by(Name, kanji: kanji_name)

    if name do
      Map.get(name, :romaji)
    end
  end
end
