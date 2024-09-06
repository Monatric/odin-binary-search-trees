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

  def insert(x, current_node = @root)
    return Node.new(x) if current_node.nil?

    return current_node if x == current_node.data

    if current_node.data > x
      current_node.left = insert(x, current_node.left)
    else
      current_node.right = insert(x, current_node.right)
    end

    current_node
  end

  def delete(x, current_node = @root)
    return if current_node.nil?

    if current_node.data == x
      if current_node.left.nil?
        return current_node = current_node.right
      elsif current_node.right.nil?
        return current_node = current_node.left
      else
        succ = current_node.right
        succ = succ.left until succ.left.nil?

        current_node.data = succ.data
        current_node.right = delete(succ.data, current_node.right)
        return current_node
      end
    end

    if current_node.data > x
      current_node.left = delete(x, current_node.left)
    else
      current_node.right = delete(x, current_node.right)
    end

    current_node
  end
end
