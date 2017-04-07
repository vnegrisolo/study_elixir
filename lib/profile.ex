defmodule Profile do
  @callback profile :: {:ok}

  @profile_dir "profiles"

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
    File.write("#{@profile_dir}/#{algorithm}", table)
  end
end
