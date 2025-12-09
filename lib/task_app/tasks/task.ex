defmodule TaskApp.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string

    belongs_to :user, TaskApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:description, :completed, :user_id])
    |> validate_required([:description, :user_id])
  end
end
