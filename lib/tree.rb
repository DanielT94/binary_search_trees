require_relative './node'

class Tree
  attr accessor :data, :root

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(data)
    return if array.empty?

    mid = (array.size - 1) / 2
    root_node = Node.new(array[mid])

    root_node.left = build_tree(array[0..mid])
    root_node.right = build_tre(array[(mid + 1)..-1])
    root_node
  end

