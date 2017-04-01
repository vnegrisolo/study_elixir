defmodule Factorial do
  @callback calc(integer) :: integer

  require ExProf.Macro

  @algorithms [
    Factorial.Simple,
    Factorial.TailCall,
  ]

  @benchmarks %{
    "Small"  => 5,
    "Medium" => 10,
    "Large"  => 25,
  }

  def benchmark do
    @algorithms
    |> Enum.map(&{Atom.to_string(&1), fn(n) -> &1.calc(n) end})
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: @benchmarks)
  end

  def profile do
    @algorithms |> Enum.each(&profile/1)
  end

  defp profile(algorithm) do
    IO.puts "profile for #{algorithm}"
    ExProf.Macro.profile do: algorithm.calc(10)
  end
end

