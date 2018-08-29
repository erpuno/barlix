defmodule Barlix.ITFTest do
  use ExUnit.Case, async: true
  import Barlix.ITF
  import TestUtils
  doctest Barlix.ITF

  test "encode" do
    assert encode!("1234") ==
             s_to_l(
               "110011001111100110000011001100111110000011111001111100110000011001100000111110011"
             )

    assert encode!("36000291452", pad: true) ==
             s_to_l(
               "11001100110000011000001111100111110011001100111110011111000001100000110011001100111110000011111000001100110011111000001100110000011111001111100110011000001100111110000011111001100000111110011001100000111110011"
             )
  end

  test "encode with checksum" do
    assert encode!("03600029145", checksum: true, pad: true) ==
             s_to_l(
               "11001100110000011000001111100111110011001100111110011111000001100000110011001100111110000011111000001100110011111000001100110000011111001111100110011000001100111110000011111001100000111110011001100000111110011"
             )
  end

  test "validation" do
    assert_raise Barlix.Error, ~r/even number/i, fn ->
      encode!("123")
    end

    assert_raise Barlix.Error, ~r/invalid character found a/i, fn ->
      encode!("123a")
    end
  end
end
