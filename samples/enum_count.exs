# Operating System: macOS
# CPU Information: Apple M1 Pro
# Number of Available Cores: 10
# Available memory: 32 GB
# Elixir 1.14.2
# Erlang 25.2

# Benchmark suite executing with the following configuration:
# warmup: 2 s
# time: 5 s
# memory time: 0 ns
# parallel: 1
# inputs: 100_000, 10_000, 10_000_000, 1_000, 1_000_000
# Estimated total run time: 35 s

# Benchmarking Enum.count/1 with input 100_000...
# Benchmarking Enum.count/1 with input 10_000...
# Benchmarking Enum.count/1 with input 10_000_000...
# Benchmarking Enum.count/1 with input 1_000...
# Benchmarking Enum.count/1 with input 1_000_000...

# ##### With input 1_000 #####
# Name                   ips        average  deviation         median         99th %
# Enum.count/1        1.59 M      629.64 ns  ±1191.05%         584 ns         750 ns

# ##### With input 10_000 #####
# Name                   ips        average  deviation         median         99th %
# Enum.count/1       68.84 K       14.53 μs    ±18.30%       14.25 μs       17.38 μs

# ##### With input 100_000 #####
# Name                   ips        average  deviation         median         99th %
# Enum.count/1        7.98 K      125.29 μs    ±12.89%      122.04 μs      192.92 μs

# ##### With input 1_000_000 #####
# Name                   ips        average  deviation         median         99th %
# Enum.count/1        838.06        1.19 ms     ±9.10%        1.16 ms        1.73 ms

# ##### With input 10_000_000 #####
# Name                   ips        average  deviation         median         99th %
# Enum.count/1         89.18       11.21 ms     ±4.22%       11.01 ms       12.87 ms

# Conclusion
#
# Even though performance is linearly correlated with the length of the list, it is still usable
# for lists with a length of less than 1_000_000.

Benchee.run(
  %{
    "Enum.count/1" => fn input ->
      Enum.count(input)
    end
  },
  inputs: %{
    "1_000" => Enum.to_list(1..1_000),
    "10_000" => Enum.to_list(1..10_000),
    "100_000" => Enum.to_list(1..100_000),
    "1_000_000" => Enum.to_list(1..1_000_000),
    "10_000_000" => Enum.to_list(1..10_000_000)
  }
)
