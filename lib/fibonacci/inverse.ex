defmodule Fibonacci.Inverse do
  @behaviour Fibonacci

  def fib(n) when n < 0, do: raise ArgumentError, message: "invalid negative argument"
  def fib(n), do: fib(n, 1, 1)

  defp fib(0, acc, _), do: acc
  defp fib(n, acc, next), do: fib(n-1, next, acc + next)
end
