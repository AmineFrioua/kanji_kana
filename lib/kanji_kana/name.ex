defmodule KanjiKana.Name do
  use Ecto.Schema
  import Ecto.Changeset

  schema "names" do
    field(:kanji, :string)
    field(:hiragana, :string)
    field(:katakana, :string)
    field(:romaji, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(name_conversion, attrs) do
    name_conversion
    |> cast(attrs, [:kanji, :hiragana, :katakana, :romaji])
    |> validate_required([:kanji, :katakana])
  end
end
