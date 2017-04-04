defmodule Factorial do
  @behaviour Benchmark
  @behaviour Profile
  @callback run(integer) :: integer

  @algorithms [
    Factorial.Simple,
    Factorial.TailCall,
  ]

  @inputs %{
    small: 5,
    medium: 10,
    large: 25,
  }

  def benchmark, do: Benchmark.benchmark(@algorithms, @inputs)

  def profile, do: Profile.profile(@algorithms, @inputs.large)
end
