defmodule Factorial.TailCall do
  @behaviour Factorial

  def run(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def run(n), do: run(n, 1)

  defp run(0, acc), do: acc
  defp run(n, acc), do: run(n-1, acc*n)
end
