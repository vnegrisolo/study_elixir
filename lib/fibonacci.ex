defmodule Fibonacci do
  @callback fib(integer) :: integer

  require ExProf.Macro

  @algorithms [
    Fibonacci.Simple,
    Fibonacci.Inverse,
  ]

  @benchmarks %{
    "Small"  => 5,
    "Medium" => 10,
    "Large"  => 25,
  }

  def benchmark do
    @algorithms
    |> Enum.map(&{Atom.to_string(&1), fn(n) -> &1.fib(n) end})
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: @benchmarks)
  end

  def profile do
    @algorithms |> Enum.each(&profile/1)
  end

  defp profile(algorithm) do
    IO.puts "profile for #{algorithm}"
    ExProf.Macro.profile do: algorithm.fib(10)
  end
end
