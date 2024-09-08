require_relative "node"
require_relative "tree"

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
test = Tree.new(arr)
test.insert(0)
test.delete(8)
test.pretty_print
# p test.root.right
# p test.level_order
test.preorder { |e| puts "test #{e}" }
# p test.preorder
