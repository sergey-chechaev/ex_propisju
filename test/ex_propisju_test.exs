defmodule ExPropisjuTest do
  use ExUnit.Case
  doctest ExPropisju

  test ".rublej" do
    assert "сто двадцать три рубля" == ExPropisju.rublej(123)
    assert "десять рублей" == ExPropisju.rublej(10)
    assert "ноль рублей 0 копеек" == ExPropisju.rublej(0)
    assert "одна тысяча рублей", ExPropisju.rublej(1000)
    assert "одна тысяча двести тридцать четыре рубля", ExPropisju.rublej(1234)
    assert "двенадцать тысяч триста сорок пять рублей", ExPropisju.rublej(12_345)
    assert "сто двадцать три тысячи четыреста пятьдесят шесть рублей", ExPropisju.rublej(123_456)
    assert "один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь рублей", ExPropisju.rublej(1_234_567)
    assert "двенадцать миллионов триста сорок пять тысяч шестьсот семьдесят восемь рублей", ExPropisju.rublej(12_345_678)
    assert "сто двадцать три миллиона четыреста пятьдесят шесть тысяч семьсот восемьдесят девять рублей", ExPropisju.rublej(123_456_789)
    assert "один миллиард двести тридцать четыре миллиона пятьсот шестьдесят семь тысяч восемьсот девяносто рублей", ExPropisju.rublej(1_234_567_890)
  end

  test ".propisju_shtuk" do
    assert "сто процентов" == ExPropisju.propisju_shtuk(100, 1, ["процент", "процентов", "процентов"])
    assert "сто двадцать три тысячи четыреста пятьдесят шесть процентов" == ExPropisju.propisju_shtuk(123_456, 1, ["процент", "процентов", "процентов"])
  end

  test ".propisju" do
    assert "сто двадцать три" == ExPropisju.propisju(123)
  end
end
