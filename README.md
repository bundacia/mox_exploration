# Mock Exploration

This app implements a `Computer` that relies on a `Calc` subcomponent for arithmetic functions. The tests use Mox to swap out the implementation of `Calc` in the tests.

To that end there is also a `CalcWithBadBehaviour` module that strays from the `CalcBehaviour` and a `ComputerWithBadImplementation` that uses the behaviour incorrectly.

The goal here is to see what types of compiler and dialyzer warnings we'll get as the implementation or mocking strays from the behaviour.

```
mix compile
mix dialyzer
mix test
```
