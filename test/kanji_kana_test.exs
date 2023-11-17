defmodule KanjiKana.KanjiKanaTest do
  use KanjiKana.DataCase, async: true

  alias KanjiKana
  alias KanjiKana.Repo

  setup do
    name = insert(:name)
    %{name: name}
  end

  describe "kanji_to_hiragana/1" do
    test "converts a given kanji name to hiragana", %{name: name} do
      assert KanjiKana.kanji_to_hiragana(name.kanji, Repo) == name.hiragana
    end

    test "returns nil if the name is not found" do
      assert KanjiKana.kanji_to_hiragana("不存在", Repo) == nil
    end
  end

  describe "kanji_to_katakana/1" do
    test "converts a given kanji name to katakana", %{name: name} do
      assert KanjiKana.kanji_to_katakana(name.kanji, Repo) == name.katakana
    end

    test "returns nil if the name is not found" do
      assert KanjiKana.kanji_to_katakana("不存在", Repo) == nil
    end
  end

  describe "kanji_to_romaji/1" do
    test "converts a given kanji name to romaji", %{name: name} do
      assert KanjiKana.kanji_to_romaji(name.kanji, Repo) == name.romaji
    end

    test "returns nil if the name is not found" do
      assert KanjiKana.kanji_to_romaji("不存在", Repo) == nil
    end
  end
end
