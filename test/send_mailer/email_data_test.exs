defmodule SendMailer.EmailDataTest do
  use SendMailer.DataCase

  alias SendMailer.EmailData

  describe "sent_email_data" do
    alias SendMailer.EmailData.SentEmailData

    import SendMailer.EmailDataFixtures

    @invalid_attrs %{exam_code: nil, payload: nil, type_email: nil}

    test "list_sent_email_data/0 returns all sent_email_data" do
      sent_email_data = sent_email_data_fixture()
      assert EmailData.list_sent_email_data() == [sent_email_data]
    end

    test "get_sent_email_data!/1 returns the sent_email_data with given id" do
      sent_email_data = sent_email_data_fixture()
      assert EmailData.get_sent_email_data!(sent_email_data.id) == sent_email_data
    end

    test "create_sent_email_data/1 with valid data creates a sent_email_data" do
      valid_attrs = %{exam_code: "some exam_code", payload: "some payload", type_email: "some type_email"}

      assert {:ok, %SentEmailData{} = sent_email_data} = EmailData.create_sent_email_data(valid_attrs)
      assert sent_email_data.exam_code == "some exam_code"
      assert sent_email_data.payload == "some payload"
      assert sent_email_data.type_email == "some type_email"
    end

    test "create_sent_email_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EmailData.create_sent_email_data(@invalid_attrs)
    end

    test "update_sent_email_data/2 with valid data updates the sent_email_data" do
      sent_email_data = sent_email_data_fixture()
      update_attrs = %{exam_code: "some updated exam_code", payload: "some updated payload", type_email: "some updated type_email"}

      assert {:ok, %SentEmailData{} = sent_email_data} = EmailData.update_sent_email_data(sent_email_data, update_attrs)
      assert sent_email_data.exam_code == "some updated exam_code"
      assert sent_email_data.payload == "some updated payload"
      assert sent_email_data.type_email == "some updated type_email"
    end

    test "update_sent_email_data/2 with invalid data returns error changeset" do
      sent_email_data = sent_email_data_fixture()
      assert {:error, %Ecto.Changeset{}} = EmailData.update_sent_email_data(sent_email_data, @invalid_attrs)
      assert sent_email_data == EmailData.get_sent_email_data!(sent_email_data.id)
    end

    test "delete_sent_email_data/1 deletes the sent_email_data" do
      sent_email_data = sent_email_data_fixture()
      assert {:ok, %SentEmailData{}} = EmailData.delete_sent_email_data(sent_email_data)
      assert_raise Ecto.NoResultsError, fn -> EmailData.get_sent_email_data!(sent_email_data.id) end
    end

    test "change_sent_email_data/1 returns a sent_email_data changeset" do
      sent_email_data = sent_email_data_fixture()
      assert %Ecto.Changeset{} = EmailData.change_sent_email_data(sent_email_data)
    end
  end
end
