defmodule Profile do
  @callback profile :: any

  require ExProf.Macro

  def profile([], _input), do: :ok
  def profile([algorithm|tail], input) do
    IO.puts "profile for #{algorithm}"
    ExProf.Macro.profile do
      algorithm.calc(input)
    end
    profile(tail, input)
  end
end
