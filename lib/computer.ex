defmodule Computer do
  
  @doc """
  ## Examples

      iex> calc(:+, [2, 3])
      5
      iex> calc(:++, [[2, 2, 2]])
      7
      iex> calc(:-, [[10, 8]])
      2
  """
  def exec(op, args) do
    fun = calc_function(op)
    apply Application.get_env(:computer, :calc), fun, args
  end

  defp calc_function(:+), do: :add
  defp calc_function(:++), do: :sum
  defp calc_function(:-), do: :diff
end
