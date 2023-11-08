defmodule KanjiKana.Repo.Migrations.CreateNames do
  use Ecto.Migration

  def change do
    create table(:names) do
      add :kanji, :string
      add :hiragana, :string
      add :katakana, :string
      add :romaji, :string

      timestamps()
    end
end
end
