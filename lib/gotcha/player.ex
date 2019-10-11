defmodule Gotcha.Player do
  use Gotcha.Query, module: __MODULE__

  schema "players" do
    field :avatar, :string
    field :email_address, :string
    field :name, :string
    field(:password, :string, virtual: true)
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:avatar, :email_address, :name, :password])
    |> validate_required([:email_address, :name, :password])
    |> validate_format(
      :email_address,
      ~r/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: "is not a valid email address"
    )
    |> unique_constraint(:email_address)
  end
end
