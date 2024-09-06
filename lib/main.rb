require_relative "node"
require_relative "tree"

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
test = Tree.new(arr)
test.insert(0)
test.pretty_print
test.delete(324)
test.pretty_print
