defmodule KanjiKana.Seeder do
  alias KanjiKana.Repo
  alias KanjiKana.Name
  require Logger

  @csv_file_path "priv/assets/names.csv"

  def seed do
    @csv_file_path
    |> File.stream!()
    |> NimbleCSV.RFC4180.parse_stream()
    |> Enum.map(&import_row/1)
    |> insert_rows
  end

  defp import_row([kanji, katakana, hiragana, romaji]) do
    now = DateTime.truncate(DateTime.utc_now(), :second)

    %{
      kanji: kanji,
      hiragana: hiragana,
      katakana: katakana,
      romaji: romaji,
      inserted_at: now,
      updated_at: now
    }
  end

  defp insert_rows(rows) do
    {number_of_records, nil} = Repo.insert_all(Name, rows)

    Logger.info("Inserted #{number_of_records} records")
  end
end
