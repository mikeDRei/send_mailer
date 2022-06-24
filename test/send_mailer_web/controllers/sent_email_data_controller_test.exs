defmodule SendMailerWeb.SentEmailDataControllerTest do
  use SendMailerWeb.ConnCase

  import SendMailer.EmailDataFixtures

  alias SendMailer.EmailData.SentEmailData

  @create_attrs %{
    exam_code: "some exam_code",
    payload: "some payload",
    type_email: "some type_email"
  }
  @update_attrs %{
    exam_code: "some updated exam_code",
    payload: "some updated payload",
    type_email: "some updated type_email"
  }
  @invalid_attrs %{exam_code: nil, payload: nil, type_email: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sent_email_data", %{conn: conn} do
      conn = get(conn, Routes.sent_email_data_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sent_email_data" do
    test "renders sent_email_data when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sent_email_data_path(conn, :create), sent_email_data: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sent_email_data_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "exam_code" => "some exam_code",
               "payload" => "some payload",
               "type_email" => "some type_email"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sent_email_data_path(conn, :create), sent_email_data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sent_email_data" do
    setup [:create_sent_email_data]

    test "renders sent_email_data when data is valid", %{conn: conn, sent_email_data: %SentEmailData{id: id} = sent_email_data} do
      conn = put(conn, Routes.sent_email_data_path(conn, :update, sent_email_data), sent_email_data: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sent_email_data_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "exam_code" => "some updated exam_code",
               "payload" => "some updated payload",
               "type_email" => "some updated type_email"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sent_email_data: sent_email_data} do
      conn = put(conn, Routes.sent_email_data_path(conn, :update, sent_email_data), sent_email_data: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sent_email_data" do
    setup [:create_sent_email_data]

    test "deletes chosen sent_email_data", %{conn: conn, sent_email_data: sent_email_data} do
      conn = delete(conn, Routes.sent_email_data_path(conn, :delete, sent_email_data))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sent_email_data_path(conn, :show, sent_email_data))
      end
    end
  end

  defp create_sent_email_data(_) do
    sent_email_data = sent_email_data_fixture()
    %{sent_email_data: sent_email_data}
  end
end
