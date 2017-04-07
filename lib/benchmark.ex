defmodule Benchmark do
  @callback benchmark :: {:ok}

  @benchmark_dir "benchmarks"

  def benchmark(algorithms, inputs) do
    algorithms
    |> Enum.map(&benchmark/1)
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: inputs)
    |> table(algorithms, inputs)
    |> save(algorithms)

    {:ok}
  end

  defp benchmark(algorithm) do
    {Atom.to_string(algorithm), fn(input) -> algorithm.run(input) end}
  end

  def table(result, algorithms, inputs) do
    (Enum.map(algorithms, &inspect/1) |> Enum.join(", ")) <>
      inspect(inputs) <>
      (
       inputs |> Map.keys |> Enum.map(fn(key) ->
         result.statistics[key] |> Map.values |> Table.table
       end) |> Enum.join("\n")
      )
  end

  def save(table, [algorithm|_tail]) do
    File.write("#{@benchmark_dir}/#{algorithm}", table)
  end
end
