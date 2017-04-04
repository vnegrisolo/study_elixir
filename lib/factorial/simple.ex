defmodule Factorial.Simple do
  @behaviour Factorial

  def run(n) when n < 0, do: raise ArgumentError, message: "negative is invalid"
  def run(0), do: 1
  def run(n), do: n * run(n-1)
end
