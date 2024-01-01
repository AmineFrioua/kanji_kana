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

  alias KanjiKana.Name
  alias KanjiKana.Translator

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
  @spec kanji_to_hiragana(String.t(), module()) :: String.t() | nil
  def kanji_to_hiragana(kanji_name, repo) do
    kanji_name = String.trim(kanji_name)
    name = repo.get_by(Name, kanji: kanji_name)

    if name do
      name.hiragana
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
  @spec kanji_to_katakana(String.t(), module()) :: String.t() | nil
  def kanji_to_katakana(kanji_name, repo) do
    kanji_name = String.trim(kanji_name)
    name = repo.get_by(Name, kanji: kanji_name)

    if name do
      name.katakana
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
  @spec kanji_to_romaji(String.t(), module()) :: String.t() | nil
  def kanji_to_romaji(kanji_name, repo) do
    kanji_name = String.trim(kanji_name)
    name = repo.get_by(Name, kanji: kanji_name)

    if name do
      name.romaji
    end
  end

  @doc """
  Converts a latin name to hirana.
  ### Parameters
  - latin_name : String.t() - The latin name to be converted.
  ### Returns
  - hiragana : String.t() - The hiragana representation of the given latin name.
  ### Examples
      iex> KanjiKana.latin_to_hiragana("Yamada Tarou")
      "やまだたろう"
  """
  @spec latin_to_hiragana(String.t()) :: String.t() | nil
  def latin_to_hiragana(latin_name) do
    latin_name
    |> Translator.normalize()
    |> Enum.map(&Translator.to_hiragana/1)
    |> Enum.join()
  end

  @doc """
  Converts a latin name to katakana.
  ### Parameters
  - latin_name : String.t() - The latin name to be converted.
  ### Returns
  - katakana : String.t() - The katakana representation of the given latin name.
  ### Examples
      iex> KanjiKana.latin_to_katakana("Yamada Tarou")
      "ヤマダタロウ"
  """

  @spec latin_to_katakana(String.t()) :: String.t() | nil
  def latin_to_katakana(latin_name) do
    latin_name
    |> Translator.normalize()
    |> Enum.map(&Translator.to_katakana/1)
    |> Enum.join()
  end
end
