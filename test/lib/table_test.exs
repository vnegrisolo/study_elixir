defmodule TableTest do
  use ExUnit.Case, async: true
  import Table

  describe "table/1" do
    test "prints single line table" do
      maps = [%{id: 1, name: "foo"}]

      assert table(maps) == """
      +----+------+
      | id | name |
      +----+------+
      | 1  | foo  |
      +----+------+
      """
    end

    test "prints double line table" do
      maps = [
        %{id: 1, name: "foo"},
        %{id: 123, name: "bar"},
      ]

      assert table(maps) == """
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
