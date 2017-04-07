defmodule Profile do
  @callback profile :: {:ok}

  @dir "profiles"

  require ExProf.Macro

  def profile([], _input), do: {:ok}
  def profile([algorithm|tail], input) do
    ExProf.Macro.profile do
      algorithm.run(input)
    end
    |> Table.table
    |> save(algorithm)

    profile(tail, input)
  end

  def save(table, algorithm) do
    File.write("#{@dir}/#{algorithm}", table)
  end
end
