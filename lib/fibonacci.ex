defmodule Fibonacci do
  @behaviour Profile
  @callback calc(integer) :: integer

  @algorithms [
    Fibonacci.Simple,
    Fibonacci.Inverse,
  ]

  @benchmarks %{
    "Small"  => 5,
    "Medium" => 10,
    "Large"  => 25,
  }

  def profile do
    Profile.profile(@algorithms, 25)
  end

  def benchmark do
    @algorithms
    |> Enum.map(&{Atom.to_string(&1), fn(n) -> &1.calc(n) end})
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: @benchmarks)
  end
end
