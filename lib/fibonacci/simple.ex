defmodule Fibonacci.Simple do
  @behaviour Fibonacci

  def calc(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def calc(0), do: 1
  def calc(1), do: 1
  def calc(n), do: calc(n-1) + calc(n-2)
end
