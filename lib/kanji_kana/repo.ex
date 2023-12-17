defmodule KanjiKana.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :kanji_kana,
    adapter: Ecto.Adapters.Postgres
end
