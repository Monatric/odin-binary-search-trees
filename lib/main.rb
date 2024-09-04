require_relative "node"
require_relative "tree"

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
n = arr.length
test = Tree.new(arr)
# test.build_tree(test, 0, n - 1)
test.pretty_print
