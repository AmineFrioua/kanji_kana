import Config

config :kanji_kana,
  ecto_repos: [KanjiKana.Repo],
  generators: [binary_id: true]

config :kanji_kana, KanjiKana.Repo,
  database: "kanji_kana_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
