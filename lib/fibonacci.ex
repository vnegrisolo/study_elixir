defmodule Fibonacci do
  @callback fib(integer) :: integer

  def benchmark do
    inputs = %{
      "Small (5)"   => 5,
      "Medium (10)" => 10,
      "Large (20)" => 20,
    }
    Benchee.run(%{
      "simple"      => fn(n) -> Fibonacci.Simple.fib(n) end,
      "inverse"     => fn(n) -> Fibonacci.Inverse.fib(n) end,
    }, time: 10, inputs: inputs)
  end
end
