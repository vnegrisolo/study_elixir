defmodule HuffmanTreeTest do
  use ExUnit.Case, async: true

  alias HuffmanTree.Node

  describe "HuffmanTree.create_tree/1" do
    test "create_tree from string" do
      assert HuffmanTree.create_tree("ABACCA") == %Node{
        right: "A",
        left: %Node{
          right: "C",
          left: %Node{
            right: "B"
          }
        }
      }
    end
  end
end
