defmodule HuffmanTree.Node do
  defstruct left: nil, right: nil
end

defmodule HuffmanTree do
  alias HuffmanTree.Node

  def create_tree(text) do
    text
    |> String.graphemes
    |> count_chars(%{})
    |> sort_chars
    |> to_tree
  end

  defp count_chars([], map), do: map
  defp count_chars([c|rest], map) do
    increment = fn value -> {value, (value || 0) + 1} end
    {_value, map} = Map.get_and_update(map, c, increment)
    count_chars(rest, map)
  end

  defp sort_chars(map) do
    map
    |> Map.keys
    |> Enum.sort_by(&Map.get(map, &1), &>=/2)
  end

  defp to_tree([]), do: nil
  defp to_tree([char|rest]), do: %Node{left: to_tree(rest), right: char}
end
