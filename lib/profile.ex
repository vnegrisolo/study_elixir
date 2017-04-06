defmodule Profile do
  @callback profile :: {:ok}

  require ExProf.Macro

  def profile([], _input), do: :ok
  def profile([algorithm|tail], input) do
    IO.puts "profile for #{algorithm}"
    profile(tail, input)
    ExProf.Macro.profile do
      algorithm.run(input)
    end
    {:ok}
  end
end
