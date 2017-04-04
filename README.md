# StudyElixir

Some algorithms in Elixir for studying.

## Profiles and Benchmarks

For running profiles and benchmarks use iex:

```shell
iex -S mix
```

### Profiles

```elixir
Factorial.profile
Fibonacci.profile
```

### Benchmarks

```elixir
Factorial.benchmark
Fibonacci.benchmark
```

### Results:

So far that's what I have:

```shell
profile for Elixir.Factorial.Simple
FUNCTION                                  CALLS        %  TIME  [uS / CALLS]
--------                                  -----  -------  ----  [----------]
erlang:send/2                                 1     0.00     0  [      0.00]
'Elixir.Factorial':'-profile/1-fun-0-'/1      1    15.22     7  [      7.00]
'Elixir.Factorial.Simple':run/1             11    84.78    39  [      3.55]
----------------------------------------  -----  -------  ----  [----------]
Total:                                       13  100.00%    46  [      3.54]
profile for Elixir.Factorial.TailCall
FUNCTION                                  CALLS        %  TIME  [uS / CALLS]
--------                                  -----  -------  ----  [----------]
erlang:send/2                                 1     0.00     0  [      0.00]
'Elixir.Factorial.TailCall':run/1            1    11.11     3  [      3.00]
'Elixir.Factorial':'-profile/1-fun-0-'/1      1    22.22     6  [      6.00]
'Elixir.Factorial.TailCall':run/2           11    66.67    18  [      1.64]
----------------------------------------  -----  -------  ----  [----------]
Total:                                       14  100.00%    27  [      1.93]
```

```shell
##### With input Large #####
Name                                ips        average  deviation         median
Elixir.Factorial.TailCall        1.29 M        0.78 μs   ±407.32%        0.70 μs
Elixir.Factorial.Simple          1.05 M        0.95 μs   ±223.20%        0.90 μs

Comparison:
Elixir.Factorial.TailCall        1.29 M
Elixir.Factorial.Simple          1.05 M - 1.23x slower

##### With input Medium #####
Name                                ips        average  deviation         median
Elixir.Factorial.TailCall        3.70 M        0.27 μs    ±30.21%        0.26 μs
Elixir.Factorial.Simple          2.74 M        0.37 μs    ±39.57%        0.35 μs

Comparison:
Elixir.Factorial.TailCall        3.70 M
Elixir.Factorial.Simple          2.74 M - 1.35x slower

##### With input Small #####
Name                                ips        average  deviation         median
Elixir.Factorial.TailCall        6.31 M       0.159 μs    ±27.55%       0.160 μs
Elixir.Factorial.Simple          4.71 M        0.21 μs    ±30.67%        0.21 μs

Comparison:
Elixir.Factorial.TailCall        6.31 M
Elixir.Factorial.Simple          4.71 M - 1.34x slower
```

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
