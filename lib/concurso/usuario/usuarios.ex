defmodule Concurso.Usuario.Usuarios do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usuario" do
    field :email, :string
    field :name, :string
    field :senha, Ecto.UUID
    field :telefone, :string
    field :timestamp, :string

    timestamps()
  end

  @doc false
  def changeset(usuarios, attrs) do
    usuarios
    |> cast(attrs, [:name, :telefone, :email, :senha, :timestamp])
    |> validate_required([:name, :telefone, :email, :senha, :timestamp])
  end
end
