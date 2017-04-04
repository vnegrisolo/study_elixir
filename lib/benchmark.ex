defmodule Benchmark do
  @callback benchmark :: any

  def benchmark(algorithms, inputs) do
    algorithms
    |> Enum.map(&benchmark/1)
    |> Enum.into(%{})
    |> Benchee.run(time: 3, inputs: inputs)
  end

  def benchmark(algorithm) do
    {Atom.to_string(algorithm), fn(input) -> algorithm.run(input) end}
  end
end
