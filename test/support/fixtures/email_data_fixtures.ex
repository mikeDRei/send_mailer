defmodule SendMailer.EmailDataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SendMailer.EmailData` context.
  """

  @doc """
  Generate a sent_email_data.
  """
  def sent_email_data_fixture(attrs \\ %{}) do
    {:ok, sent_email_data} =
      attrs
      |> Enum.into(%{
        exam_code: "some exam_code",
        payload: "some payload",
        type_email: "some type_email"
      })
      |> SendMailer.EmailData.create_sent_email_data()

    sent_email_data
  end
end
