defmodule Concurso.Repo do
  use Ecto.Repo,
    otp_app: :concurso,
    adapter: Ecto.Adapters.Postgres
end
