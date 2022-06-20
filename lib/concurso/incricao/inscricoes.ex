defmodule Concurso.Incricao.Inscricoes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incricao" do
    field :votos, :integer
    field :id_usuario, :id
    field :id_sorteio, :id

    timestamps()
  end

  @doc false
  def changeset(inscricoes, attrs) do
    inscricoes
    |> cast(attrs, [:votos])
    |> validate_required([:votos])
  end
end
