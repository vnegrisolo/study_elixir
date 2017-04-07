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

    test "prints float number rounding it to 2 decimals" do
      maps = [
        %{id: 1, name: "foo", value: 14.5678},
        %{id: 123, name: "bar", value: -87.0},
      ]

      assert table(maps) == """
      +-----+------+-------+
      | id  | name | value |
      +-----+------+-------+
      | 1   | foo  | 14.57 |
      | 123 | bar  | -87.0 |
      +-----+------+-------+
      """
    end
  end
end
