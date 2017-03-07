# ExPropisju [![Build Status](https://travis-ci.org/sergey-chechaev/ex_propisju.svg?branch=master)](https://travis-ci.org/sergey-chechaev/ex_propisju)
Копипаст кода гема Ruby https://github.com/julik/ru_propisju на elixir.
Выводит сумму прописью, рублей и гривен. Помогает в выборе правильного числительного.

## Example
``` elixir
  iex(1)> ExPropisju.rublej(1234)
  "одна тысяча двести тридцать четыре рубля"
  iex(2)> ExPropisju.propisju_shtuk(212, 1, ["сволочь", "сволочи", "сволочей"])
  "двести двенадцать сволочей"
  iex(3)> ExPropisju.propisju_shtuk(100, 1, ["процент", "процентов", "процентов"])
  "сто процентов"
  iex(3)> ExPropisju.propisju(1000)
  "одна тысяча"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_propisju` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ex_propisju, "~> 0.1.2"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_propisju](https://hexdocs.pm/ex_propisju).
