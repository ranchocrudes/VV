defmodule ConcursoWeb.InscricoesView do
  use ConcursoWeb, :view
  alias ConcursoWeb.InscricoesView

  def render("index.json", %{incricao: incricao}) do
    %{data: render_many(incricao, InscricoesView, "inscricoes.json")}
  end

  def render("show.json", %{inscricoes: inscricoes}) do
    %{data: render_one(inscricoes, InscricoesView, "inscricoes.json")}
  end

  def render("inscricoes.json", %{inscricoes: inscricoes}) do
    %{
      id: inscricoes.id,
      votos: inscricoes.votos
    }
  end
end
