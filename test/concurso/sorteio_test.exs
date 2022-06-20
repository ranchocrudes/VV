defmodule Concurso.SorteioTest do
  use Concurso.DataCase

  alias Concurso.Sorteio

  describe "sorteio" do
    alias Concurso.Sorteio.Sorteios

    import Concurso.SorteioFixtures

    @invalid_attrs %{descricao: nil, nome: nil, timestamp: nil}

    test "list_sorteio/0 returns all sorteio" do
      sorteios = sorteios_fixture()
      assert Sorteio.list_sorteio() == [sorteios]
    end

    test "get_sorteios!/1 returns the sorteios with given id" do
      sorteios = sorteios_fixture()
      assert Sorteio.get_sorteios!(sorteios.id) == sorteios
    end

    test "create_sorteios/1 with valid data creates a sorteios" do
      valid_attrs = %{descricao: "some descricao", nome: "some nome", timestamp: "some timestamp"}

      assert {:ok, %Sorteios{} = sorteios} = Sorteio.create_sorteios(valid_attrs)
      assert sorteios.descricao == "some descricao"
      assert sorteios.nome == "some nome"
      assert sorteios.timestamp == "some timestamp"
    end

    test "create_sorteios/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sorteio.create_sorteios(@invalid_attrs)
    end

    test "update_sorteios/2 with valid data updates the sorteios" do
      sorteios = sorteios_fixture()
      update_attrs = %{descricao: "some updated descricao", nome: "some updated nome", timestamp: "some updated timestamp"}

      assert {:ok, %Sorteios{} = sorteios} = Sorteio.update_sorteios(sorteios, update_attrs)
      assert sorteios.descricao == "some updated descricao"
      assert sorteios.nome == "some updated nome"
      assert sorteios.timestamp == "some updated timestamp"
    end

    test "update_sorteios/2 with invalid data returns error changeset" do
      sorteios = sorteios_fixture()
      assert {:error, %Ecto.Changeset{}} = Sorteio.update_sorteios(sorteios, @invalid_attrs)
      assert sorteios == Sorteio.get_sorteios!(sorteios.id)
    end

    test "delete_sorteios/1 deletes the sorteios" do
      sorteios = sorteios_fixture()
      assert {:ok, %Sorteios{}} = Sorteio.delete_sorteios(sorteios)
      assert_raise Ecto.NoResultsError, fn -> Sorteio.get_sorteios!(sorteios.id) end
    end

    test "change_sorteios/1 returns a sorteios changeset" do
      sorteios = sorteios_fixture()
      assert %Ecto.Changeset{} = Sorteio.change_sorteios(sorteios)
    end
  end
end
