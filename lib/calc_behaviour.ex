defmodule CalcBehaviour do
  @callback sum([number, ...]) :: number
  @callback diff(number, number) :: number
  @callback add(number, number) :: number
end
