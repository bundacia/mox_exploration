defmodule CalcWithoutSpecs do
  @behaviour CalcBehaviour

  @impl CalcBehaviour
  @doc """
  Adds Stuff

  Has no spec and does not conform to the behaviour spec.

  Dialyzer gives this warning:
  lib/calc_without_specs.ex:15: The inferred return type of add/2 (binary()) has nothing in common with number(), which is the expected return type for the callback of the 'Elixir.CalcBehaviour' behaviour

  ## Examples:

      iex> add(2, 2)
      "4"
  """
  def add(n1, n2), do: to_string(n1 + n2)

  @impl CalcBehaviour
  @doc """
  Adds Stuff

  ## Examples:

      iex> sum([1, 2, 3])
      6
  """
  def sum(list), do: Enum.sum(list)

  @impl CalcBehaviour
  @doc """
  Returns difference

  ## Examples:

      iex> diff(10, 5)
      5
  """
  def diff(n1, n2), do: n1 - n2
end
