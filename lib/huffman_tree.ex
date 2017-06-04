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

  def encode(tree, text) do
    text
    |> String.graphemes
    |> Enum.map(&find_encode(tree, &1))
    |> Enum.join
  end

  defp count_chars([], map), do: map
  defp count_chars([c|rest], map) do
    increment = fn value -> {value, (value || 0) + 1} end
    # increment = &{&1, (&1 || 0) + 1}
    {_value, map} = Map.get_and_update(map, c, increment)
    count_chars(rest, map)
  end

  defp sort_chars(map) do
    map
    |> Map.keys
    |> Enum.sort_by(&Map.get(map, &1), &>=/2)
  end

  defp to_tree([]), do: nil
  defp to_tree([c|rest]), do: %Node{left: to_tree(rest), right: c}

  defp find_encode(tree, char, acc \\ "")
  defp find_encode(%Node{right: c}, c, acc), do: acc <> "1"
  defp find_encode(tree, c, acc) do
    find_encode(tree.left, c, acc <> "0")
  end
end
