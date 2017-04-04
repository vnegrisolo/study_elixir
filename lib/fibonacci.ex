defmodule Fibonacci do
  @behaviour Benchmark
  @behaviour Profile
  @callback run(integer) :: integer

  @algorithms [
    Fibonacci.Simple,
    Fibonacci.Inverse,
  ]

  @inputs %{
    small: 5,
    medium: 10,
    large: 25,
  }

  def benchmark, do: Benchmark.benchmark(@algorithms, @inputs)

  def profile, do: Profile.profile(@algorithms, @inputs.large)
end
