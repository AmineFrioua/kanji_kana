defmodule KanjiKana.Application do
  use Application

  def start(_type, _args) do
    children = [
      KanjiKana.Repo
      # other children...
    ]

    opts = [strategy: :one_for_one, name: KanjiKana.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
