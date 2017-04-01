defmodule Fibonacci.Accumulator do
  @behaviour Fibonacci

  def fib(n) when n < 0, do: raise ArgumentError, message: "invalid negative argument"
  def fib(n), do: fib(n, 0)

  defp fib(0, acc), do: acc + 1
  defp fib(1, acc), do: acc + 1
  defp fib(n, acc), do: fib(n-1, acc + fib(n-2))
end
