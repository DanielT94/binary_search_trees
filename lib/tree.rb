require_relative './node'
require 'pp'

public
#Pretty print visualises the tree
def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

class Tree
  attr_accessor :data, :root

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(array)
    return if array.empty?

    mid = (array.size - 1) / 2
    root_node = Node.new(array[mid])

    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[(mid + 1)..-1])
    root_node
  end

  def insert(value, node = @root)
    return if value == node.data
    
    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
  end

  def delete(value, node = root)
    #if tree is empty
    return node if node.nil?
    #otherwise recur down the tree
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # node to be deleted is the leaf
      #node to be deleted has >= 1 child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      #node to be deleted has two children
      #find min value in right tree
      leftmost_node = leftmost_leaf(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node, node.right)
    end
    node
  end

  #method to find min value in a tree/subtree
  def leftmost_leaf(node)
    node = node.left until node.left.nil?

      node
    end
  end
end


