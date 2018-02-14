defmodule ComputerWithBadImplementationTest do
  use ExUnit.Case
  import ComputerWithBadImplementation
  import Mox

  describe "exec" do
    test ":+" do
      CalcMock |> expect(:add, fn 1, 1 -> {:ok, 99} end)
      assert exec(:+, [1, 1]) == 99
    end

    test ":-" do
      CalcMock |> expect(:diff, fn 10, 5 -> {:ok, 99} end)
      assert exec(:-, [10, 5]) == 99
    end

    test ":++" do
      CalcMock |> expect(:sum, fn [1, 1, 1] -> {:ok, 99} end)
      assert exec(:++, [[1, 1, 1]]) == 99
    end
  end
end
