defmodule Gotcha.Player do
  use Gotcha.Query, module: __MODULE__

  schema "players" do
    field :avatar, :string
    field :email_address, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:avatar, :email_address, :name, :password_hash])
    |> validate_required([:avatar, :email_address, :name, :password_hash])
    |> unique_constraint(:email_address)
  end
end
