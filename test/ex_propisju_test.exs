defmodule ExPropisjuTest do
  use ExUnit.Case
  doctest ExPropisju

  test ".rublej" do
    assert "сто двадцать три рубля" == ExPropisju.rublej(123)
    assert "десять рублей" == ExPropisju.rublej(10)
    assert "ноль рублей 0 копеек" == ExPropisju.rublej(0)
    assert "одна тысяча рублей", ExPropisju.rublej(1000)
  end
end
