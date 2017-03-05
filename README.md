# ExPropisju

## Description:
Копипаст кода гема на Ruby https://github.com/julik/ru_propisju на elixir
Выводит сумму прописью, рублей и гривен. Помогает в выборе правильного числительного.

## Example
``` elixir
  iex(1)> ExPropisju.rublej(1234)
  "одна тысяча двести тридцать четыре рубля"
  iex(2)> ExPropisju.propisju_shtuk(212, 1, ["сволочь", "сволочи", "сволочей"])
  "двести двенадцать сволочей"
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

# ex_propisju
