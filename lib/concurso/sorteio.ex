defmodule Concurso.Sorteio do
  @moduledoc """
  The Sorteio context.
  """

  import Ecto.Query, warn: false
  alias Concurso.Repo

  alias Concurso.Sorteio.Sorteios

  @doc """
  Returns the list of sorteio.

  ## Examples

      iex> list_sorteio()
      [%Sorteios{}, ...]

  """
  def list_sorteio do
    Repo.all(Sorteios)
  end

  @doc """
  Gets a single sorteios.

  Raises `Ecto.NoResultsError` if the Sorteios does not exist.

  ## Examples

      iex> get_sorteios!(123)
      %Sorteios{}

      iex> get_sorteios!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sorteios!(id), do: Repo.get!(Sorteios, id)

  @doc """
  Creates a sorteios.

  ## Examples

      iex> create_sorteios(%{field: value})
      {:ok, %Sorteios{}}

      iex> create_sorteios(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sorteios(attrs \\ %{}) do
    %Sorteios{}
    |> Sorteios.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sorteios.

  ## Examples

      iex> update_sorteios(sorteios, %{field: new_value})
      {:ok, %Sorteios{}}

      iex> update_sorteios(sorteios, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sorteios(%Sorteios{} = sorteios, attrs) do
    sorteios
    |> Sorteios.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sorteios.

  ## Examples

      iex> delete_sorteios(sorteios)
      {:ok, %Sorteios{}}

      iex> delete_sorteios(sorteios)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sorteios(%Sorteios{} = sorteios) do
    Repo.delete(sorteios)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sorteios changes.

  ## Examples

      iex> change_sorteios(sorteios)
      %Ecto.Changeset{data: %Sorteios{}}

  """
  def change_sorteios(%Sorteios{} = sorteios, attrs \\ %{}) do
    Sorteios.changeset(sorteios, attrs)
  end
end
