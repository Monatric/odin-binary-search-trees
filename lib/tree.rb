require_relative "node"

# Tree
class Tree
  attr_accessor :processed_arr, :root, :start_arr, :end_arr

  def initialize(arr)
    @processed_arr = arr.dup.uniq.sort
    @start_arr = 0
    @end_arr = processed_arr.length - 1
    @root = build_tree(processed_arr, start_arr, end_arr)
  end

  def build_tree(arr, start_arr, end_arr)
    return if start_arr > end_arr

    mid = (start_arr + end_arr) / 2
    root = Node.new(arr[mid])
    root.left = build_tree(arr, start_arr, mid - 1)
    root.right = build_tree(arr, mid + 1, end_arr)

    root
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
