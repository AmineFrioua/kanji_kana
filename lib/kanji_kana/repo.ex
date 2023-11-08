defmodule KanjiKana.Repo do
  use Ecto.Repo,
    otp_app: :kanji_kana,
    adapter: Ecto.Adapters.Postgres
end
