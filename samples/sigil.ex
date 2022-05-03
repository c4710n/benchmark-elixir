# BENCHMARK RESULT #
#
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

# Benchmarking empty...
# Benchmarking ~m...
# Benchmarking ~M...

# Name            ips        average  deviation         median         99th %
# empty       46.66 M       21.43 ns  ±1384.47%           0 ns          90 ns
# ~m           7.79 M      128.32 ns   ±323.87%           0 ns         990 ns
# ~M           0.23 M     4335.94 ns   ±373.14%        3990 ns        6990 ns

# Comparison:
# empty       46.66 M
# ~m           7.79 M - 5.99x slower +106.89 ns
# ~M           0.23 M - 202.31x slower +4314.51 ns

# CONCLUSION #
# + merging classes via macro is faster.

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
end

defmodule Benchmark do
  import Teo

  def run() do
    Benchee.run(%{
      "empty" => fn ->
        nil
      end,
      "~m" => fn ->
        ~m(bg-black text-green-500)
      end,
      "~M" => fn ->
        ~M(bg-black text-green-500)
      end
    })
  end
end

Benchmark.run()
