defmodule Fibonacci.Simple do
  @behaviour Fibonacci

  def fib(n) when n < 0, do: raise ArgumentError, message: "invalid negative argument"
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)
end
