defmodule Benchmark do
  @callback benchmark :: {:ok}

  def benchmark(algorithms, inputs) do
    algorithms
    |> Enum.map(&benchmark/1)
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: inputs)
    {:ok}
  end

  defp benchmark(algorithm) do
    {Atom.to_string(algorithm), fn(input) -> algorithm.run(input) end}
  end
end