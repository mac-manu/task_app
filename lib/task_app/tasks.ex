defmodule TaskApp.Tasks do
  @moduledoc """
  The Tasks context.
  """

  import Ecto.Query, warn: false
  alias TaskApp.Repo

  alias TaskApp.Tasks.Task

  @doc """
  Returns the list of tasks for a given user.

  ## Examples

      iex> list_tasks(user)
      [%Task{}, ...]

  """
  def list_tasks(user) do
    Repo.all(from t in Task, where: t.user_id == ^user.id)
  end

  @doc """
  Gets a single task for a given user.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123, user)
      %Task{}

      iex> get_task!(456, user)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id, user) do
    Repo.one!(from t in Task, where: t.id == ^id and t.user_id == ^user.id)
  end

  @doc """
  Creates a task for a given user.

  ## Examples

      iex> create_task(user, %{field: value})
      {:ok, %Task{}}

      iex> create_task(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(user, attrs \\ %{}) do
    %Task{}
    |> Task.changeset(Map.put(attrs, :user_id, user.id))
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{data: %Task{}}

  """
  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end
end
