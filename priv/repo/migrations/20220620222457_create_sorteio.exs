defmodule Concurso.Repo.Migrations.CreateSorteio do
  use Ecto.Migration

  def change do
    create table(:sorteio) do
      add :nome, :string
      add :descricao, :string
      add :timestamp, :string

      timestamps()
    end
  end
end
