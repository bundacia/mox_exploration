defmodule ComputerTest do
  use ExUnit.Case
  import Computer
  import Mox

  describe "exec" do
    test ":+" do
      CalcMock |> expect(:add, fn 1, 1 -> 99 end)
      assert exec(:+, [1, 1]) == 99
    end

    test ":-" do
      CalcMock |> expect(:diff, fn 10, 5 -> 99 end)
      assert exec(:-, [10, 5]) == 99
    end

    test ":++" do
      CalcMock |> expect(:sum, fn [1, 1, 1] -> 99 end)
      assert exec(:++, [[1, 1, 1]]) == 99
    end
  end
end
