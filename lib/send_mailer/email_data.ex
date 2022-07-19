defmodule SendMailer.EmailData do
  @moduledoc """
  The EmailData context.
  """

  import Ecto.Query, warn: false
  alias SendMailer.Repo

  alias SendMailer.EmailData.SentEmailData

  @doc """
  Returns the list of sent_email_data.

  ## Examples

      iex> list_sent_email_data()
      [%SentEmailData{}, ...]

  """
  def list_sent_email_data do
    Repo.all(SentEmailData)
  end

  @doc """
  Gets a single sent_email_data.

  Raises `Ecto.NoResultsError` if the Sent email data does not exist.

  ## Examples

      iex> get_sent_email_data!(123)
      %SentEmailData{}

      iex> get_sent_email_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sent_email_data!(id), do: Repo.get!(SentEmailData, id)

  def get_email!(email) do
    query = from sent in "sent_email_data",
      where: u.email == ^email,
      select: [:id, :email, :event_id, :event_time, :message_id]
    Repo.all(query)
  end
  @doc """
  Creates a sent_email_data.

  ## Examples

      iex> create_sent_email_data(%{field: value})
      {:ok, %SentEmailData{}}

      iex> create_sent_email_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sent_email_data(attrs \\ %{}) do
    %SentEmailData{}
    |> SentEmailData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sent_email_data.

  ## Examples

      iex> update_sent_email_data(sent_email_data, %{field: new_value})
      {:ok, %SentEmailData{}}

      iex> update_sent_email_data(sent_email_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sent_email_data(%SentEmailData{} = sent_email_data, attrs) do
    sent_email_data
    |> SentEmailData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sent_email_data.

  ## Examples

      iex> delete_sent_email_data(sent_email_data)
      {:ok, %SentEmailData{}}

      iex> delete_sent_email_data(sent_email_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sent_email_data(%SentEmailData{} = sent_email_data) do
    Repo.delete(sent_email_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sent_email_data changes.

  ## Examples

      iex> change_sent_email_data(sent_email_data)
      %Ecto.Changeset{data: %SentEmailData{}}

  """
  def change_sent_email_data(%SentEmailData{} = sent_email_data, attrs \\ %{}) do
    SentEmailData.changeset(sent_email_data, attrs)
  end
end
