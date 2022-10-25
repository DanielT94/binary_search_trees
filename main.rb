require_relative 'lib/tree'
require_relative 'lib/node'

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)
tree.pretty_print
p tree.balanced?
tree.level_order
p(//)
tree.preorder
p(//)
tree.inorder
p(//)
tree.postorder
p(//)
tree.insert(104)
tree.insert(124)
tree.insert(115)
p tree.balanced?
tree.rebalance
p tree.balanced?
tree.level_order
p(//)
tree.preorder
p(//)
tree.inorder
p(//)
tree.postorder
p(//)
