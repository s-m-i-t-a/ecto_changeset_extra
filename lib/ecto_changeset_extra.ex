defmodule EctoChangesetExtra do
  @moduledoc """
  A set of extra functions for Ecto.Changeset.
  """

  alias Ecto.Changeset

  def apply_changes(%Changeset{valid?: true} = changeset) do
    Result.ok(Changeset.apply_changes(changeset))
  end

  def apply_changes(changeset) do
    Result.error(changeset)
  end
end
