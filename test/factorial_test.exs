defmodule FactorialTest do
  use ExUnit.Case, async: true
  ExUnit.Case.register_attribute __ENV__, :values
  ExUnit.Case.register_attribute __ENV__, :module

  [Factorial.Simple, Factorial.TailCall]
  |> Enum.each(fn(module) ->
    describe "#{module}.run/1" do
      @module module
      test "factorial for -1", context do
        module = context.registered.module
        assert_raise ArgumentError, fn ->
          module.run(-1) == 1
        end
      end

      [1, 1, 2, 6, 24, 120, 720]
      |> Enum.with_index
      |> Enum.each(fn({output, input}) ->
        @module module
        @values {input, output}
        test "factorial for #{input}", context do
          module = context.registered.module
          {input, output} = context.registered.values
          assert module.run(input) == output
        end
      end)
    end
  end)
end
