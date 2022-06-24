defmodule SendMailer.Email do
  @moduledoc """
  The Email context.
  """

  import Ecto.Query, warn: false
  alias SendMailer.Repo

  alias SendMailer.Email.SendEmail

  @doc """
  Returns the list of send_email.

  ## Examples

      iex> list_send_email()
      [%SendEmail{}, ...]

  """
  def list_send_email do
    Repo.all(SendEmail)
  end

  @doc """
  Gets a single send_email.

  Raises `Ecto.NoResultsError` if the Send email does not exist.

  ## Examples

      iex> get_send_email!(123)
      %SendEmail{}

      iex> get_send_email!(456)
      ** (Ecto.NoResultsError)

  """
  def get_send_email!(id), do: Repo.get!(SendEmail, id)

  @doc """
  Creates a send_email.

  ## Examples

      iex> create_send_email(%{field: value})
      {:ok, %SendEmail{}}

      iex> create_send_email(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_send_email(attrs \\ %{}) do
    %SendEmail{}
    |> SendEmail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a send_email.

  ## Examples

      iex> update_send_email(send_email, %{field: new_value})
      {:ok, %SendEmail{}}

      iex> update_send_email(send_email, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_send_email(%SendEmail{} = send_email, attrs) do
    send_email
    |> SendEmail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a send_email.

  ## Examples

      iex> delete_send_email(send_email)
      {:ok, %SendEmail{}}

      iex> delete_send_email(send_email)
      {:error, %Ecto.Changeset{}}

  """
  def delete_send_email(%SendEmail{} = send_email) do
    Repo.delete(send_email)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking send_email changes.

  ## Examples

      iex> change_send_email(send_email)
      %Ecto.Changeset{data: %SendEmail{}}

  """
  def change_send_email(%SendEmail{} = send_email, attrs \\ %{}) do
    SendEmail.changeset(send_email, attrs)
  end
end
