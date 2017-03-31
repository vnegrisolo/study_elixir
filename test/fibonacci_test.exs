defmodule FibonacciTest do
  use ExUnit.Case, async: true
  ExUnit.Case.register_attribute __ENV__, :values

  describe "Fibonacci.Simple.fib/1" do
    test "fibonacci for -1" do
      assert_raise ArgumentError, fn ->
        Fibonacci.Simple.fib(-1) == 1
      end
    end

    [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    |> Enum.with_index
    |> Enum.each(fn({output, input}) ->
      @values {input, output}
      test "fibonacci for #{input}", context do
        {input, output} = context.registered.values
        assert Fibonacci.Simple.fib(input) == output
      end
    end)
  end
end
