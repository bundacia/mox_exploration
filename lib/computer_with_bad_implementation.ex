defmodule ComputerWithBadImplementation do
  
  @doc """
  ## Examples

      iex> exec(:+, [2, 3])
      5
      iex> exec(:++, [[2, 2, 2]])
      7
      iex> exec(:-, [[10, 8]])
      2

  ## Details

  This function makes several wrong assumptions about the behaviour implemented by its Calc.

  * `:+` - Wrong arity
  * `:-` - Wrong return type
  * `:++ - Wrong function name

  ### Wrong Arity
 
  The first mistake (wrong arity) causes the follwing exception in the tests:

  ```
  1) test exec :++ (ComputerWithBadImplementationTest)
     test/computer_with_bad_implementation_test.exs:17
     ** (ArgumentError) unknown function add_all/1 for mock CalcMock
     code: CalcMock |> expect(:add_all, fn [1, 1, 1] -> 99 end)
     stacktrace:
       (mox) lib/mox.ex:298: Mox.add_expectation!/4
       (mox) lib/mox.ex:264: Mox.expect/4
       test/computer_with_bad_implementation_test.exs:18: (test)
  ```

  ### Wrong Return Type

  The second mistake (wrong return type) does not cause the tests to fail or any warnings to be emited. Mox does no checking of the spec of the Mox'ed function to make sure the mock matches.

  ### Wrong Function Name

  The third mistake (wrong function name) causes this error:

  ```
  2) test exec :+ (ComputerWithBadImplementationTest)
     test/computer_with_bad_implementation_test.exs:7
     ** (ArgumentError) unknown function add/3 for mock CalcMock
     code: CalcMock |> expect(:add, fn 1, 1, :extra_arg -> 99 end)
     stacktrace:
       (mox) lib/mox.ex:298: Mox.add_expectation!/4
       (mox) lib/mox.ex:264: Mox.expect/4
       test/computer_with_bad_implementation_test.exs:8: (test)
  ```
  """
  def exec(:+, [a, b]) do
    Application.get_env(:computer, :calc).add(a, b, :extra_arg)
  end
  def exec(:-, [a, b]) do
    {:ok, result} = Application.get_env(:computer, :calc).diff(a, b)
    result
  end
  def exec(:++, list) do
    Application.get_env(:computer, :calc).add_all(list)
  end

end
