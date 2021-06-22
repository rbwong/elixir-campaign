defmodule VampWeb.SandalControllerTest do
  use VampWeb.ConnCase

  alias Vamp.Shoes
  alias Vamp.Shoes.Sandal

  @create_attrs %{
    code: "some code",
    color_set: "some color_set",
    name: "some name"
  }
  @update_attrs %{
    code: "some updated code",
    color_set: "some updated color_set",
    name: "some updated name"
  }
  @invalid_attrs %{code: nil, color_set: nil, name: nil}

  def fixture(:sandal) do
    {:ok, sandal} = Shoes.create_sandal(@create_attrs)
    sandal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sandals", %{conn: conn} do
      conn = get(conn, Routes.sandal_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sandal" do
    test "renders sandal when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sandal_path(conn, :create), sandal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sandal_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some code",
               "color_set" => "some color_set",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sandal_path(conn, :create), sandal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sandal" do
    setup [:create_sandal]

    test "renders sandal when data is valid", %{conn: conn, sandal: %Sandal{id: id} = sandal} do
      conn = put(conn, Routes.sandal_path(conn, :update, sandal), sandal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sandal_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some updated code",
               "color_set" => "some updated color_set",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sandal: sandal} do
      conn = put(conn, Routes.sandal_path(conn, :update, sandal), sandal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sandal" do
    setup [:create_sandal]

    test "deletes chosen sandal", %{conn: conn, sandal: sandal} do
      conn = delete(conn, Routes.sandal_path(conn, :delete, sandal))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sandal_path(conn, :show, sandal))
      end
    end
  end

  defp create_sandal(_) do
    sandal = fixture(:sandal)
    %{sandal: sandal}
  end
end
