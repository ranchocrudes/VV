defmodule Concurso.SorteioFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Concurso.Sorteio` context.
  """

  @doc """
  Generate a sorteios.
  """
  def sorteios_fixture(attrs \\ %{}) do
    {:ok, sorteios} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        nome: "some nome",
        timestamp: "some timestamp"
      })
      |> Concurso.Sorteio.create_sorteios()

    sorteios
  end
end
