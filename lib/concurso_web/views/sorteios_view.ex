defmodule ConcursoWeb.SorteiosView do
  use ConcursoWeb, :view
  alias ConcursoWeb.SorteiosView

  def render("index.json", %{sorteio: sorteio}) do
    %{data: render_many(sorteio, SorteiosView, "sorteios.json")}
  end

  def render("show.json", %{sorteios: sorteios}) do
    %{data: render_one(sorteios, SorteiosView, "sorteios.json")}
  end

  def render("sorteios.json", %{sorteios: sorteios}) do
    %{
      id: sorteios.id,
      nome: sorteios.nome,
      descricao: sorteios.descricao,
      timestamp: sorteios.timestamp
    }
  end
end
