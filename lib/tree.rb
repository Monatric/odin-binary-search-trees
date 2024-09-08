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

  def insert(value, current_node = @root)
    return Node.new(value) if current_node.nil?

    return current_node if value == current_node.data

    if current_node.data > value
      current_node.left = insert(value, current_node.left)
    else
      current_node.right = insert(value, current_node.right)
    end

    current_node
  end

  def delete(value, current_node = @root)
    return if current_node.nil?

    if current_node.data == value
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

    if current_node.data > value
      current_node.left = delete(value, current_node.left)
    else
      current_node.right = delete(value, current_node.right)
    end

    current_node
  end

  def find(value, current_node = @root)
    if current_node.nil?
      return nil
    elsif value == current_node.data
      return value
    end

    if current_node.data > value
      current_node.left = find(value, current_node.left)
    else
      current_node.right = find(value, current_node.right)
    end
  end

  # def level_order(current_node = @root, values = [])
  #   # iteration version
  #   queue = []
  #   queue.push(current_node)
  #   until queue.empty?
  #     front = queue[0]
  #     if block_given?
  #       yield(front)
  #     else
  #       values << front.data
  #     end
  #     queue.push(front.left) unless front.left.nil?
  #     queue.push(front.right) unless front.right.nil?
  #     queue.shift
  #   end
  #   values unless block_given?
  # end

  def level_order(current_node = @root, queue = [@root], values = [], &block)
    # recursive version
    return values if current_node.nil?

    front = queue[0]
    values << front.data unless front.nil?
    unless queue.empty?
      block.call(front.data) if block_given?
      queue.push(front.left) unless front.left.nil?
      queue.push(front.right) unless front.right.nil?
    end
    queue.shift
    level_order(front, queue, values, &block)
    values unless block_given?
  end

  def preorder(current_node = @root, values = [], &block)
    return values if current_node.nil?

    block.call(current_node.data)
    values << current_node.data
    preorder(current_node.left, values, &block)
    preorder(current_node.right, values, &block)
    values unless block_given?
  end
end
