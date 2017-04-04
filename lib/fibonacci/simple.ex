defmodule Fibonacci.Simple do
  @behaviour Fibonacci

  def run(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def run(0), do: 1
  def run(1), do: 1
  def run(n), do: run(n-1) + run(n-2)
end
