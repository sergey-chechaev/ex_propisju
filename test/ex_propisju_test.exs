defmodule ExPropisjuTest do
  use ExUnit.Case
  doctest ExPropisju

  test ".rublej" do
    assert "сто двадцать три рубля" == ExPropisju.rublej(123)
  end
end
