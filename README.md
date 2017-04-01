# StudyElixir

Some algorithms in Elixir for studying.

## Profiles and Benchmarks

For running profiles and benchmarks use iex:

```shell
iex -S mix
```

### Profiles

```elixir
Fibonacci.profile
```

### Benchmarks

```elixir
Fibonacci.benchmark
```

### Results:

So far that's what I have:

```shell
profile for Elixir.Fibonacci.Simple
FUNCTION                                  CALLS        %  TIME  [uS / CALLS]
--------                                  -----  -------  ----  [----------]
erlang:send/2                                 1     0.00     0  [      0.00]
'Elixir.Fibonacci':'-profile/1-fun-0-'/1      1     1.24     6  [      6.00]
'Elixir.Fibonacci.Simple':fib/1             177    98.76   476  [      2.69]
----------------------------------------  -----  -------  ----  [----------]
Total:                                      179  100.00%   482  [      2.69]
profile for Elixir.Fibonacci.Inverse
FUNCTION                                  CALLS        %  TIME  [uS / CALLS]
--------                                  -----  -------  ----  [----------]
erlang:send/2                                 1     0.00     0  [      0.00]
'Elixir.Fibonacci.Inverse':fib/1              1    17.39     4  [      4.00]
'Elixir.Fibonacci':'-profile/1-fun-0-'/1      1    30.43     7  [      7.00]
'Elixir.Fibonacci.Inverse':fib/3             11    52.17    12  [      1.09]
----------------------------------------  -----  -------  ----  [----------]
Total:                                       14  100.00%    23  [      1.64]
```

```shell
##### With input Large #####
Name                               ips        average  deviation         median
Elixir.Fibonacci.Inverse        3.11 M     0.00032 ms    ±15.33%     0.00032 ms
Elixir.Fibonacci.Simple      0.00027 M        3.67 ms     ±7.84%        3.60 ms

Comparison:
Elixir.Fibonacci.Inverse        3.11 M
Elixir.Fibonacci.Simple      0.00027 M - 11398.95x slower

##### With input Medium #####
Name                               ips        average  deviation         median
Elixir.Fibonacci.Inverse        6.01 M       0.167 μs    ±27.35%       0.160 μs
Elixir.Fibonacci.Simple         0.36 M        2.78 μs    ±27.34%        2.70 μs

Comparison:
Elixir.Fibonacci.Inverse        6.01 M
Elixir.Fibonacci.Simple         0.36 M - 16.71x slower

##### With input Small #####
Name                               ips        average  deviation         median
Elixir.Fibonacci.Inverse        8.47 M       0.118 μs    ±33.53%       0.120 μs
Elixir.Fibonacci.Simple         3.54 M        0.28 μs    ±38.06%        0.27 μs

Comparison:
Elixir.Fibonacci.Inverse        8.47 M
Elixir.Fibonacci.Simple         3.54 M - 2.39x slower
```
