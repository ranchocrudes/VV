defmodule Concurso.IncricaoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Concurso.Incricao` context.
  """

  @doc """
  Generate a inscricoes.
  """
  def inscricoes_fixture(attrs \\ %{}) do
    {:ok, inscricoes} =
      attrs
      |> Enum.into(%{
        votos: 42
      })
      |> Concurso.Incricao.create_inscricoes()

    inscricoes
  end
end
