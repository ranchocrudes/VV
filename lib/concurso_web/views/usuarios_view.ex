defmodule ConcursoWeb.UsuariosView do
  use ConcursoWeb, :view
  alias ConcursoWeb.UsuariosView

  def render("index.json", %{usuario: usuario}) do
    %{data: render_many(usuario, UsuariosView, "usuarios.json")}
  end

  def render("show.json", %{usuarios: usuarios}) do
    %{data: render_one(usuarios, UsuariosView, "usuarios.json")}
  end

  def render("usuarios.json", %{usuarios: usuarios}) do
    %{
      id: usuarios.id,
      name: usuarios.name,
      telefone: usuarios.telefone,
      email: usuarios.email,
      senha: usuarios.senha,
      timestamp: usuarios.timestamp
    }
  end
end
