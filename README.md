# Mock Exploration

This app implements a `Computer` that relies on a `Calc` subcomponent for arithmetic functions. The tests use Mox to swap out the implementation of `Calc` in the tests.

The goal here is to see what types of compiler and dialyzer warnings we'll get as the implementation or mocking strays from the behaviour.

To that end there is also a `CalcWithBadBehaviour` module that strays from the `CalcBehaviour` and a `ComputerWithBadImplementation` that uses the behaviour incorrectly. See the docs from those modules for details. Here's an overview:


| Case | Compiler Warnings? | Dialyzer Warning? | Test Fauilure? |
|------|--------------------|-------------------|----------------|
| Behavior Implementation with missing function | ✅ | ✅ | 🚫 |
| Behavior Implementation with mis-named function (with @impl tag) | ✅ | ✅ | 🚫 |
| Behavior Implementation with mis-named function (and missing @impl) | ✅ | ✅ | 🚫 |
| Mock doesn't match correct arity | 🚫 | 🚫 | ✅ |
| Mock non-existant function | 🚫 | 🚫 | ✅ | 
| Mock mock doesn't match typespec | 🚫 | 🚫 | 🚫 |

Read [the package docs](https://bundacia.github.io/mox_exploration) for full details. Code is on [GitHub](https://github.com/bundacia/mox_exploration).

## Usage

Run compile and run dialyzer to see warnings. You'll need to remove the `_build` file to make sure things really get compiled.

```
rm -rf _build
mix compile
mix dialyzer
mix test
```

## Docs

To regenerate the docs content for github run

```
mix gh_docs
```
