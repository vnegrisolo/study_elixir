defmodule FibonacciTest do
  use ExUnit.Case, async: true
  ExUnit.Case.register_attribute __ENV__, :values
  ExUnit.Case.register_attribute __ENV__, :module

  [Fibonacci.Simple, Fibonacci.Inverse]
  |> Enum.each(fn(module) ->
    describe "#{module}.fib/1" do
      @module module
      test "fibonacci for -1", context do
        module = context.registered.module
        assert_raise ArgumentError, fn ->
          module.fib(-1) == 1
        end
      end

      [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
      |> Enum.with_index
      |> Enum.each(fn({output, input}) ->
        @module module
        @values {input, output}
        test "fibonacci for #{input}", context do
          module = context.registered.module
          {input, output} = context.registered.values
          assert module.fib(input) == output
        end
      end)
    end
  end)
end
