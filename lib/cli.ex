defmodule CLI do
  @algorithms [
    Conditional,
    Factorial,
    Fibonacci,
  ]
  @profile_dir "profiles"

  def main do
    File.rmdir(@profile_dir)
    File.mkdir(@profile_dir)

    @algorithms |> Enum.map(&(&1.profile()))
  end
end
