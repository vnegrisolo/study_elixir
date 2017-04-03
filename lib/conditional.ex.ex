defmodule Conditional do
  require ExProf.Macro

  @algorithms [
    Conditional.If,
    Conditional.Case,
    Conditional.Bool,
  ]

  @benchmarks %{
    "Truthy"  => true,
    "Falsy" => false,
  }

  def benchmark do
    @algorithms
    |> Enum.map(&{Atom.to_string(&1), fn(n) -> &1.cond(n) end})
    |> Enum.into(%{})
    |> Benchee.run(time: 5, inputs: @benchmarks)
  end

  def profile do
    @algorithms |> Enum.each(&profile/1)
  end

  defp profile(algorithm) do
    IO.puts "profile for #{algorithm}"
    ExProf.Macro.profile do: algorithm.cond(true)
    ExProf.Macro.profile do: algorithm.cond(false)
  end
end

defmodule Conditional.If do
  def cond(input) do
    if input == true do
      "true"
    else
      "false"
    end
  end
end

defmodule Conditional.Case do
  def cond(input) do
    case input do
      true -> "true"
      _    -> "false"
    end
  end
end

defmodule Conditional.Bool do
  def cond(input) do
    input == true && "true" || "false"
  end
end
