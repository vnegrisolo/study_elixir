defmodule Fibonacci.Inverse do
  @behaviour Fibonacci

  def calc(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def calc(n), do: calc(n, 1, 1)

  defp calc(0, acc, _), do: acc
  defp calc(n, acc, next), do: calc(n-1, next, acc + next)
end
