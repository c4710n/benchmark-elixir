Benchee.run(
  %{
    "byte_size" => &byte_size/1,
    "String.length" => &String.length/1
  },
  inputs: %{
    0 => String.duplicate("x", 0),
    10 => String.duplicate("x", 10),
    100 => String.duplicate("x", 100),
    1000 => String.duplicate("x", 1000),
    10000 => String.duplicate("x", 10000),
    100_000 => String.duplicate("x", 100_000),
    1_000_000 => String.duplicate("x", 1_000_000),
    10_000_000 => String.duplicate("x", 10_000_000),
    100_000_000 => String.duplicate("x", 100_000_000)
  }
)

# Result
#
# Operating System: macOS
# CPU Information: Apple M1 Pro
# Number of Available Cores: 10
# Available memory: 32 GB
# Elixir 1.13.4
# Erlang 25.0.2

# Benchmark suite executing with the following configuration:
# warmup: 2 s
# time: 5 s
# memory time: 0 ns
# parallel: 1
# inputs: 0, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000
# Estimated total run time: 2.10 min

# Benchmarking String.length with input 0...
# Benchmarking String.length with input 10...
# Benchmarking String.length with input 100...
# Benchmarking String.length with input 1000...
# Benchmarking String.length with input 10000...
# Benchmarking String.length with input 100000...
# Benchmarking String.length with input 1000000...
# Benchmarking String.length with input 10000000...
# Benchmarking String.length with input 100000000...
# Benchmarking byte_size with input 0...
# Benchmarking byte_size with input 10...
# Benchmarking byte_size with input 100...
# Benchmarking byte_size with input 1000...
# Benchmarking byte_size with input 10000...
# Benchmarking byte_size with input 100000...
# Benchmarking byte_size with input 1000000...
# Benchmarking byte_size with input 10000000...
# Benchmarking byte_size with input 100000000...

# ##### With input 0 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          172.00 M        5.81 ns±226711.45%           0 ns           0 ns
# String.length        7.24 M      138.21 ns ±47377.33%           0 ns           0 ns

# Comparison:
# byte_size          172.00 M
# String.length        7.24 M - 23.77x slower +132.40 ns

# ##### With input 10 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          160.32 M     0.00624 μs±214044.73%           0 μs           0 μs
# String.length        0.93 M        1.08 μs  ±7400.93%        0.21 μs        1.33 μs

# Comparison:
# byte_size          160.32 M
# String.length        0.93 M - 172.87x slower +1.07 μs

# ##### With input 100 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          153.71 M     0.00651 μs±212547.61%           0 μs           0 μs
# String.length       0.104 M        9.61 μs   ±840.40%        3.17 μs       57.33 μs

# Comparison:
# byte_size          153.71 M
# String.length       0.104 M - 1477.27x slower +9.60 μs

# ##### With input 1000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          149.83 M     0.00667 μs±204084.62%           0 μs           0 μs
# String.length      0.0149 M       67.11 μs   ±111.14%       27.17 μs      294.11 μs

# Comparison:
# byte_size          149.83 M
# String.length      0.0149 M - 10054.82x slower +67.10 μs

# ##### With input 10000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          150.92 M     0.00663 μs±203419.71%           0 μs           0 μs
# String.length     0.00189 M      530.42 μs    ±29.34%      528.96 μs      866.68 μs

# Comparison:
# byte_size          150.92 M
# String.length     0.00189 M - 80050.78x slower +530.42 μs

# ##### With input 100000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          155.76 M     0.00001 ms±208486.43%           0 ms           0 ms
# String.length     0.00034 M        2.96 ms     ±6.73%        2.93 ms        3.43 ms

# Comparison:
# byte_size          155.76 M
# String.length     0.00034 M - 460885.32x slower +2.96 ms

# ##### With input 1000000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          172.36 M     0.00001 ms±221463.53%           0 ms           0 ms
# String.length     0.00003 M       29.73 ms     ±3.86%       29.76 ms       32.05 ms

# Comparison:
# byte_size          172.36 M
# String.length     0.00003 M - 5123328.99x slower +29.73 ms

# ##### With input 10000000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          168.85 M     0.00001 ms±222239.12%           0 ms           0 ms
# String.length     0.00000 M      298.57 ms     ±2.20%      299.55 ms      305.59 ms

# Comparison:
# byte_size          168.85 M
# String.length     0.00000 M - 50414431.20x slower +298.57 ms

# ##### With input 100000000 #####
# Name                    ips        average  deviation         median         99th %
# byte_size          112.00 M      0.00000 s±194330.42%            0 s            0 s
# String.length     0.00000 M         2.93 s     ±0.16%         2.93 s         2.93 s

# Comparison:
# byte_size          112.00 M
# String.length     0.00000 M - 328204444.32x slower +2.93 s
