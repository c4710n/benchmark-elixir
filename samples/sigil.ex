# BENCHMARK RESULT #

# Operating System: macOS
# CPU Information: Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz
# Number of Available Cores: 12
# Available memory: 16 GB
# Elixir 1.13.3
# Erlang 24.2

# Benchmark suite executing with the following configuration:
# warmup: 2 s
# time: 5 s
# memory time: 0 ns
# parallel: 1
# inputs: none specified
# Estimated total run time: 21 s

# Benchmarking ~M...
# Benchmarking ~m...
# Warning: The function you are trying to benchmark is super fast, making measurements more unreliable!
# This holds especially true for memory measurements.
# See: https://github.com/PragTob/benchee/wiki/Benchee-Warnings#fast-execution-warning

# You may disable this warning by passing print: [fast_warning: false] as configuration options.

# Benchmarking ~x...

# Name           ips        average  deviation         median         99th %
# ~m         95.47 M       10.47 ns   ±241.07%          10 ns          20 ns
# ~x          3.68 M      271.70 ns  ±8634.89%           0 ns        1000 ns
# ~M          0.23 M     4322.70 ns   ±380.97%        4000 ns        9000 ns

# Comparison:
# ~m         95.47 M
# ~x          3.68 M - 25.94x slower +261.23 ns
# ~M          0.23 M - 412.71x slower +4312.23 ns

# CONCLUSION #

# + ~m is the fastest, but it doesn't support string interpolation, which make it useless.
# + ~x is slower than ~m, but it supports string interpolation.

defmodule Teo do
  @moduledoc """
  Different sigil implementation of merging class string.
  """

  @doc """
  Merging classes via macro.
  """
  defmacro sigil_m({:<<>>, _, [string]}, []) do
    string
    |> String.trim()
    |> String.split(~r/\s+/)
    |> Enum.join(" ")
  end

  @doc """
  Merging classes via function.
  """
  def sigil_M(string, []) do
    string
    |> String.trim()
    |> String.split(~r/\s+/)
    |> Enum.join(" ")
  end

  @doc """
  Merging classes via wrapped ~w.
  """
  defmacro sigil_x(term, modifiers) do
    quote do
      Kernel.sigil_w(unquote(term), unquote(modifiers))
      |> Enum.join(" ")
    end
  end
end

defmodule Benchmark do
  import Teo

  def run() do
    Benchee.run(%{
      "~m" => fn ->
        ~m(bg-black text-green-500)
      end,
      "~M" => fn ->
        ~M(bg-black text-green-500)
      end,
      "~x" => fn ->
        ~x(bg-black text-green-500)
      end
    })
  end
end

Benchmark.run()
