defmodule CalcWithBadBehaviour do
  @moduledoc """
  This is an implementation of the `CalcBehaviour` that strays from the behaviour in several ways.

  You can enable this implementation instead of the `Calc` module by setting `MIX_ENV` to `broken`.

  ```
  % MIX_ENV=broken iex -S mix
  ```
  """

  @behaviour CalcBehaviour

  @impl CalcBehaviour
  @spec sum([number, ...]) :: {:ok, number}
  @doc """
  Adds a list of numbers.
 
  ## Examples:

      iex> sum([1, 2, 3])
      {:ok, 6}

  ## Details

  This function does not correctly implement the `CalcBehaviour.sum`, returning a tuple instead of a number.

  The following dialyzer warnings are emitted:

  ```
  lib/calc_with_bad_behaviour.ex:5: The return type {'ok',number()} in the specification of sum/1 is not a subtype of number(), which is the expected return type for the callback of the 'Elixir.CalcBehaviour' behaviour
  lib/calc_with_bad_behaviour.ex:14: The inferred return type of sum/1 ({'ok',number()}) has nothing in common with number(), which is the expected return type for the callback of the 'Elixir.CalcBehaviour' behaviour
  ```

  This happens even if we comment out the `@impl CalcBehaviour` attribute.

  """
  def sum(list), do: {:ok, Enum.sum(list)}

  @spec difference(number, number) :: number
  @doc """
  Returns difference

  ## Examples:

      iex> difference(10, 5)
      5

  ## Details

  This function name does not match the one in the spec (`diff`) and we forgot to add the `@impl CalcBehaviour` attribute.

  We get the following compiler warning:

  ```
  warning: function diff/2 required by behaviour CalcBehaviour is not implemented (in module CalcWithBadBehaviour)
    lib/calc_with_bad_behaviour.ex:1
  ```

  And we get the following dialyzer warning:

  ```
  lib/calc_with_bad_behaviour.ex:1: Undefined callback function diff/2 (behaviour 'Elixir.CalcBehaviour')
  ```
  """
  def difference(n1, n2), do: n1 - n2

  @impl CalcBehaviour
  @spec addition(number, number) :: number
  @doc """
  Returns the sum of two numbers

  ## Examples:

      iex> addition(10, 5)
      15

  ## Details

  This function name does not match the one in the spec (`add`) but we did remember the `@impl CalcBehaviour` attribute.

  We get the following compiler warnings:

  ```
  warning: got "@impl CalcBehaviour" for function addition/2 but this behaviour does not specify such callback. The known callbacks are:

    * CalcBehaviour.add/2 (function)
    * CalcBehaviour.diff/2 (function)
    * CalcBehaviour.sum/1 (function)

    lib/calc_with_bad_behaviour.ex:61

  warning: function add/2 required by behaviour CalcBehaviour is not implemented (in module CalcWithBadBehaviour)
    lib/calc_with_bad_behaviour.ex:1
  ```

  And we get the following dialyzer warning:

  ```
  lib/calc_with_bad_behaviour.ex:1: Undefined callback function add/2 (behaviour 'Elixir.CalcBehaviour')
  ```
  """
  def addition(n1, n2), do: n1 + n2
end
