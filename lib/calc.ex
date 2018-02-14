defmodule Calc do
  @behaviour CalcBehaviour

  @impl CalcBehaviour
  @spec add(number, number) :: number
  @doc """
  Adds Stuff

  ## Examples:

      iex> add(2, 2)
      4
  """
  def add(n1, n2), do: n1 + n2

  @impl CalcBehaviour
  @spec sum([number, ...]) :: number
  @doc """
  Adds Stuff

  ## Examples:

      iex> sum([1, 2, 3])
      6
  """
  def sum(list), do: Enum.sum(list)

  @impl CalcBehaviour
  @spec diff(number, number) :: number
  @doc """
  Returns difference

  ## Examples:

      iex> diff(10, 5)
      5
  """
  def diff(n1, n2), do: n1 - n2
end
