defmodule ComputerWithBadImplementation do
  
  @doc """
  ## Examples

      iex> calc(:+, [2, 3])
      5
      iex> calc(:++, [[2, 2, 2]])
      7
      iex> calc(:-, [[10, 8]])
      2

  ## Details

  This function mistakenly assumes that all `Calc` functions return status
  tuples instead of raw numbers. But since the mocks in its tests also make
  that assumption the tests all pass and there are no warnings.
  """
  def exec(op, args) do
    fun = calc_function(op)
    # Mistakenly expect tuples back from `Calc` functions
    {:ok, result} = apply Application.get_env(:computer, :calc), fun, args
    result
  end

  defp calc_function(:+), do: :add
  defp calc_function(:++), do: :sum
  defp calc_function(:-), do: :diff
end
