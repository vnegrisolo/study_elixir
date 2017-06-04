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
    |> Enum.map(&encode_char(&1, tree))
    |> Enum.join
  end

  def decode(tree, binary), do: find_decode(tree, binary)

  defp count_chars([], map) do
    map
  end
  defp count_chars([char|rest], map) do
    increment = &{&1, (&1 || 0) + 1}
    {_value, map} = Map.get_and_update(map, char, increment)
    count_chars(rest, map)
  end

  defp sort_chars(map) do
    map |> Map.keys |> Enum.sort_by(&Map.get(map, &1), &>=/2)
  end

  defp to_tree([]), do: nil
  defp to_tree([char|rest]), do: %Node{left: to_tree(rest), right: char}

  defp encode_char(char, tree, acc \\ "")
  defp encode_char(char, %Node{right: char}, acc), do: acc <> "1"
  defp encode_char(char, tree, acc), do: encode_char(char, tree.left, acc <> "0")

  defp find_decode(tree, node \\ nil, binary, acc \\ "")
  defp find_decode(_tree, _node, "", acc), do: acc
  defp find_decode(tree, node, "1" <> rest, acc) do
    find_decode(tree, tree, rest, acc <> (node || tree).right)
  end
  defp find_decode(tree, node, "0" <> rest, acc) do
    find_decode(tree, (node || tree).left, rest, acc)
  end
end
