defmodule Teo do
  use Bitwise

  @base 16

  def read(hex_str, n) do
    hex_str
    |> binary_to_integer()
    |> get_bit(n)
    |> integer_to_binary()
  end

  def write(hex_str, n) do
    hex_str
    |> binary_to_integer()
    |> set_bit(n)
    |> integer_to_binary()
  end

  def create_sample_hex_str(n) do
    0
    |> set_bit(n)
    |> integer_to_binary()
  end

  defp binary_to_integer(binary) do
    :erlang.binary_to_integer(binary, @base)
  end

  defp integer_to_binary(integer) do
    :erlang.integer_to_binary(integer, @base)
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
    "read" => fn {hex_str, n} -> Teo.read(hex_str, n) end,
    "write" => fn {hex_str, n} -> Teo.write(hex_str, n) end
  },
  inputs: %{
    "xs length - high bit (10)" => {Teo.create_sample_hex_str(10), 10},
    "xs length - low bit  (10)" => {Teo.create_sample_hex_str(10), 1},
    "sm length - high bit (1000)" => {Teo.create_sample_hex_str(1000), 1000},
    "sm length - low bit  (1000)" => {Teo.create_sample_hex_str(1000), 1},
    "md length - high bit (5000)" => {Teo.create_sample_hex_str(5000), 5000},
    "md length - low bit  (5000)" => {Teo.create_sample_hex_str(5000), 1},
    "lg length - high bit (10_000)" => {Teo.create_sample_hex_str(10_000), 10_000},
    "lg length - low bit  (10_000)" => {Teo.create_sample_hex_str(10_000), 1},
    "xl length - high bit (100_000)" => {Teo.create_sample_hex_str(100_000), 100_000},
    "xl length - low bit  (100_000)" => {Teo.create_sample_hex_str(100_000), 1},
    "ex length - high bit (1_000_000)" => {Teo.create_sample_hex_str(1_000_000), 1_000_000},
    "ex length - low bit  (1_000_000)" => {Teo.create_sample_hex_str(1_000_000), 1}
  }
)
