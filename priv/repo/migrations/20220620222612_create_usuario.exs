defmodule Concurso.Repo.Migrations.CreateUsuario do
  use Ecto.Migration

  def change do
    create table(:usuario) do
      add :name, :string
      add :telefone, :string
      add :email, :string
      add :senha, :uuid
      add :timestamp, :string

      timestamps()
    end
  end
end
