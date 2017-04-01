defmodule PalindromeTest do
  use ExUnit.Case, async: true
  ExUnit.Case.register_attribute __ENV__, :values

  describe "Palindrome.assert/1" do
    [
      {"",    true},
      {"aba", true},
      {"ábá", true},
      {"dog", false},
    ]
    |> Enum.each(fn({input, output}) ->
      @values {input, output}
      test "palindrome for #{input}", context do
        {input, output} = context.registered.values
        assert Palindrome.assert(input) == output
      end
    end)
  end
end
