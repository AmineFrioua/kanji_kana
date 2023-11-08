defmodule KanjiKana.Factory do
  use ExMachina.Ecto, repo: KanjiKana.Repo

  def name_factory(attrs \\ %{}) do
    %KanjiKana.Name{
      kanji: attrs[:kanji] || "山田太郎",
      hiragana: attrs[:hiragana] || "やまだたろう",
      katakana: attrs[:katakana] || "ヤマダタロウ",
      romaji: attrs[:romaji] || "Yamada Tarou"
    }
  end
end
