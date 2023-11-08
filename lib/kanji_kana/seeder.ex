defmodule KanjiKana.Seeder do
  alias KanjiKana.Repo
  alias KanjiKana.Name
  require Logger

  @csv_file_path "priv/assets/names.csv"

  def seed do
    @csv_file_path
    |> File.stream!()
    |> NimbleCSV.RFC4180.parse_stream()
    |> Enum.each(&import_row/1)
  end

  defp import_row([kanji, katakana, hiragana, romaji]) do
    %Name{
      kanji: kanji,
      hiragana: hiragana,
      katakana: katakana,
      romaji: romaji
    }
    |> Repo.insert(ignore_conflicts: true)
    |> log_result(kanji)
  end

  defp log_result({:ok, _name}, kanji) do
    Logger.info("Inserted name for Kanji: #{kanji}")
  end

  defp log_result({:error, changeset}, kanji) do
    Logger.error("Failed to insert name for Kanji: #{kanji}. Reason: #{inspect(changeset)}")
  end
end
