defmodule CalcTest do
  use ExUnit.Case
  doctest Calc, import: true
  doctest CalcWithBadBehaviour, import: true
end
