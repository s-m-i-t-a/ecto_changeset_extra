defmodule EctoChangesetExtra do
  @moduledoc """
  A set of extra functions for Ecto.Changeset.
  """

  alias Ecto.Changeset

  @spec apply_changes(Changeset.t(a)) :: Result.t(Changeset.t(a), a) when a: var
  def apply_changes(%Changeset{valid?: true} = changeset) do
    Result.ok(Changeset.apply_changes(changeset))
  end

  def apply_changes(changeset) do
    Result.error(changeset)
  end

  @spec to_error_map(Changeset.t()) :: %{required(atom()) => [String.t()]}
  def to_error_map(%Changeset{valid?: false} = changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
