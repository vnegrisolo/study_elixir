defmodule Palindrome do
  def assert(""), do: true
  def assert(text) do
    String.first(text) == String.last(text)
      && assert(String.slice(text, 1..-2))
  end
end
