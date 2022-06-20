defmodule Concurso.Repo.Migrations.CreateIncricao do
  use Ecto.Migration

  def change do
    create table(:incricao) do
      add :votos, :integer
      add :id_usuario, references(:usuario, on_delete: :nothing)
      add :id_sorteio, references(:sorteio, on_delete: :nothing)

      timestamps()
    end

    create index(:incricao, [:id_usuario])
    create index(:incricao, [:id_sorteio])
  end
end
