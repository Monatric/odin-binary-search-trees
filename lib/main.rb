require_relative "node"
require_relative "tree"

# arr = (Array.new(15) { rand(1..100) })
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
p arr
test = Tree.new(arr)
test.pretty_print
puts "Is it balanced?: #{test.balanced?}"
puts "Level order: #{test.level_order}"
puts "Preorder: #{test.preorder}"
puts "Postorder: #{test.postorder}"
puts "Inorder: #{test.inorder}"
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# 10.times do |n|
#   test.insert(rand(100..200))
#   if n == 9
#     test.pretty_print
#     puts "Is it balanced?: #{test.balanced?}"
#   end
# end

test.rebalance
puts "Level order: #{test.level_order}"
puts "Preorder: #{test.preorder}"
puts "Postorder: #{test.postorder}"
puts "Inorder: #{test.inorder}"
