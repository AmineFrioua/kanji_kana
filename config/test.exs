import Config

# Configure your database
config :kanji_kana, KanjiKana.Repo,
  username: "postgres",
  password: "postgres",
  database: "kanji_kana_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Use Print only for test "mix test"
config :logger, :console,
  format: "[$level] $message\n",
  metadata: [:test_id, :file, :line]

# Configure ExUnit
config :ex_unit,
  capture_log: true,
  exclude: [pending: true]
