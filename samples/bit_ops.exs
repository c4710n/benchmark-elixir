defmodule Teo do
  use Bitwise

  def read(hex, n) do
    hex
    |> get_bit(n)
  end

  def write(hex, n) do
    hex
    |> set_bit(n)
  end

  def create_sample_hex(n) do
    set_bit(0, n)
  end

  defp get_bit(integer, n) do
    integer >>> n &&& 1
  end

  defp set_bit(integer, n) do
    1 <<< n ||| integer
  end
end

Benchee.run(
  %{
    "read" => fn {hex, n} -> Teo.read(hex, n) end,
    "write" => fn {hex, n} -> Teo.write(hex, n) end
  },
  inputs: %{
    "xs length - high bit (10)" => {Teo.create_sample_hex(10), 10},
    "xs length - low bit  (10)" => {Teo.create_sample_hex(10), 1},
    "sm length - high bit (1000)" => {Teo.create_sample_hex(1000), 1000},
    "sm length - low bit  (1000)" => {Teo.create_sample_hex(1000), 1},
    "md length - high bit (5000)" => {Teo.create_sample_hex(5000), 5000},
    "md length - low bit  (5000)" => {Teo.create_sample_hex(5000), 1},
    "lg length - high bit (10_000)" => {Teo.create_sample_hex(10_000), 10_000},
    "lg length - low bit  (10_000)" => {Teo.create_sample_hex(10_000), 1},
    "xl length - high bit (100_000)" => {Teo.create_sample_hex(100_000), 100_000},
    "xl length - low bit  (100_000)" => {Teo.create_sample_hex(100_000), 1},
    "ex length - high bit (1_000_000)" => {Teo.create_sample_hex(1_000_000), 1_000_000},
    "ex length - low bit  (1_000_000)" => {Teo.create_sample_hex(1_000_000), 1}
  }
)
