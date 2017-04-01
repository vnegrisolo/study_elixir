defmodule Factorial.Simple do
  @behaviour Factorial

  def calc(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def calc(0), do: 1
  def calc(n), do: n * calc(n-1)
end
