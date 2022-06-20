defmodule Concurso.Sorteio.Sorteios do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sorteio" do
    field :descricao, :string
    field :nome, :string
    field :timestamp, :string

    timestamps()
  end

  @doc false
  def changeset(sorteios, attrs) do
    sorteios
    |> cast(attrs, [:nome, :descricao, :timestamp])
    |> validate_required([:nome, :descricao, :timestamp])
  end
end
