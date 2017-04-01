defmodule Factorial.TailCall do
  @behaviour Factorial

  def calc(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def calc(n), do: calc(n, 1)

  defp calc(0, acc), do: acc
  defp calc(n, acc), do: calc(n-1, acc*n)
end
