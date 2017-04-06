defmodule TableTest do
  use ExUnit.Case, async: true
  import Table

  describe "table/1" do
    test "prints single line table" do
      foo = %{id: 1, name: "foo"}

      assert table([foo]) == """
      +----+------+
      | id | name |
      +----+------+
      | 1  | foo  |
      +----+------+
      """
    end

    test "prints double line table" do
      foo = %{id: 1, name: "foo"}
      bar = %{id: 123, name: "bar"}

      assert table([foo, bar]) == """
      +-----+------+
      | id  | name |
      +-----+------+
      | 1   | foo  |
      | 123 | bar  |
      +-----+------+
      """
    end
  end
end
