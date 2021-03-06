defmodule PinBin.Pin do
  @moduledoc"""
  Pin model.

  A pin stores information about a place or location.
  """

  use PinBinWeb, :model

  @required_fields ~w(name latitude longitude)a
  @optional_fields ~w()a

  schema "pins" do
    field :name, :string
    field :latitude, :float
    field :longitude, :float
    belongs_to :user, PinBin.User
    belongs_to :bin, PinBin.Bin

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
