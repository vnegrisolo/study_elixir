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

  describe "HuffmanTree.encode/2" do
    test "encode string" do
      tree = %Node{
        right: "A",
        left: %Node{
          right: "C",
          left: %Node{
            right: "B"
          }
        }
      }
      assert HuffmanTree.encode(tree, "ABACCA") == "1001101011"
    end
  end
end
