require_relative './node'

class Tree
  attr accessor :data, :root

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(data)
    
  end

