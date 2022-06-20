defmodule ConcursoWeb.SorteiosController do
  use ConcursoWeb, :controller

  alias Concurso.Sorteio
  alias Concurso.Sorteio.Sorteios

  action_fallback ConcursoWeb.FallbackController

  def index(conn, _params) do
    sorteio = Sorteio.list_sorteio()
    render(conn, "index.json", sorteio: sorteio)
  end

  def create(conn, %{"sorteios" => sorteios_params}) do
    with {:ok, %Sorteios{} = sorteios} <- Sorteio.create_sorteios(sorteios_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sorteios_path(conn, :show, sorteios))
      |> render("show.json", sorteios: sorteios)
    end
  end

  def show(conn, %{"id" => id}) do
    sorteios = Sorteio.get_sorteios!(id)
    render(conn, "show.json", sorteios: sorteios)
  end

  def update(conn, %{"id" => id, "sorteios" => sorteios_params}) do
    sorteios = Sorteio.get_sorteios!(id)

    with {:ok, %Sorteios{} = sorteios} <- Sorteio.update_sorteios(sorteios, sorteios_params) do
      render(conn, "show.json", sorteios: sorteios)
    end
  end

  def delete(conn, %{"id" => id}) do
    sorteios = Sorteio.get_sorteios!(id)

    with {:ok, %Sorteios{}} <- Sorteio.delete_sorteios(sorteios) do
      send_resp(conn, :no_content, "")
    end
  end
end
