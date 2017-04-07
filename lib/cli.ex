defmodule CLI do
  @algorithms [
    Conditional,
    Factorial,
    Fibonacci,
  ]
  @profile_dir "profiles"
  @benchmark_dir "benchmarks"

  def main do
    File.rmdir(@profile_dir)
    File.mkdir(@profile_dir)
    File.rmdir(@benchmark_dir)
    File.mkdir(@benchmark_dir)

    @algorithms |> Enum.map(&(&1.profile()))
    @algorithms |> Enum.map(&(&1.benchmark()))
  end
end
