# StudyElixir

Some algorithms in Elixir for studying.

## Benchmarks

For running benchmarks use iex:

```shell
iex -S mix
```

```elixir
Fibonacci.benchmark
```

So far that's what I have:

```shell
##### With input Large (20) #####
Name              ips        average  deviation         median
inverse        3.94 M        0.25 μs    ±23.08%        0.24 μs
simple      0.00301 M      332.03 μs    ±10.48%      324.00 μs

Comparison:
inverse        3.94 M
simple      0.00301 M - 1309.15x slower

##### With input Medium (10) #####
Name              ips        average  deviation         median
inverse        7.07 M       0.141 μs   ±106.39%       0.140 μs
simple         0.36 M        2.75 μs    ±83.33%        2.70 μs

Comparison:
inverse        7.07 M
simple         0.36 M - 19.46x slower

##### With input Small (5) #####
Name              ips        average  deviation         median
inverse       11.40 M      0.0878 μs    ±18.87%      0.0850 μs
simple         3.81 M        0.26 μs    ±59.02%        0.25 μs

Comparison:
inverse       11.40 M
simple         3.81 M - 2.99x slower
```
