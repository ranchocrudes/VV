defmodule ConcursoWeb.SorteiosControllerTest do
  use ConcursoWeb.ConnCase

  import Concurso.SorteioFixtures

  alias Concurso.Sorteio.Sorteios

  @create_attrs %{
    descricao: "some descricao",
    nome: "some nome",
    timestamp: "some timestamp"
  }
  @update_attrs %{
    descricao: "some updated descricao",
    nome: "some updated nome",
    timestamp: "some updated timestamp"
  }
  @invalid_attrs %{descricao: nil, nome: nil, timestamp: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sorteio", %{conn: conn} do
      conn = get(conn, Routes.sorteios_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sorteios" do
    test "renders sorteios when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sorteios_path(conn, :create), sorteios: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sorteios_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some descricao",
               "nome" => "some nome",
               "timestamp" => "some timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sorteios_path(conn, :create), sorteios: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sorteios" do
    setup [:create_sorteios]

    test "renders sorteios when data is valid", %{conn: conn, sorteios: %Sorteios{id: id} = sorteios} do
      conn = put(conn, Routes.sorteios_path(conn, :update, sorteios), sorteios: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sorteios_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao",
               "nome" => "some updated nome",
               "timestamp" => "some updated timestamp"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sorteios: sorteios} do
      conn = put(conn, Routes.sorteios_path(conn, :update, sorteios), sorteios: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sorteios" do
    setup [:create_sorteios]

    test "deletes chosen sorteios", %{conn: conn, sorteios: sorteios} do
      conn = delete(conn, Routes.sorteios_path(conn, :delete, sorteios))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sorteios_path(conn, :show, sorteios))
      end
    end
  end

  defp create_sorteios(_) do
    sorteios = sorteios_fixture()
    %{sorteios: sorteios}
  end
end
