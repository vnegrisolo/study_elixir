defmodule HuffmanTreeTest do
  use ExUnit.Case, async: true
  ExUnit.Case.register_attribute __ENV__, :text

  alias HuffmanTree.Node
  import HuffmanTree, only: [create_tree: 1, encode: 2, decode: 2]

  @tree %Node{
    right: "A",
    left: %Node{
      right: "C",
      left: %Node{
        right: "B",
        left: nil
      }
    }
  }

  describe "create_tree/1" do
    test "create_tree from string" do
      assert create_tree("ABACCA") == @tree
    end
  end

  describe "encode/2" do
    test "encode string" do
      assert encode(@tree, "ABACCA") == "1001101011"
    end
  end

  describe "decode/2" do
    test "decode string" do
      assert decode(@tree, "1001101011") == "ABACCA"
    end
  end

  describe "encode/2 |> decode/2" do
    ~w[
      ABACCA
      ABABABA
      CBCBCBCC
      ewfrsdajkhasdfjhasfa
      eivŃaïve
    ]
    |> Enum.with_index
    |> Enum.each(fn(elem) ->
      {text, index} = elem
      @text text
      test "tree/encode/decode for '#{index}'", context do
        text = context.registered.text
        tree = create_tree(text)
        encoded = encode(tree, text)
        assert decode(tree, encoded) == text
      end
    end)
  end
end
