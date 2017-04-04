defmodule Fibonacci.Inverse do
  @behaviour Fibonacci

  def run(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def run(n), do: run(n, 1, 0)

  defp run(0, acc, _), do: acc
  defp run(n, acc, last), do: run(n-1, acc + last, acc)
end
