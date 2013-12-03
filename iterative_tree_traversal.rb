tree_iter = Iter.new(tree)
while (node = tree_iter.next_node)
  puts node
end

class Iter
  def initialize(root)
    @root = root
    @bottom_node = get_bottom_left(root)
    @last_node = nil
  end

  def get_bottom_left(root)
    temp = root
    while temp.left
      temp = temp.left
    end
    temp
  end

  # def next_node
  #   if @last_node.nil?
  #     @last_node, @current_node = @current_node, @current_node.parent
  #     return @last_node
  #   end
  #   if @last_node == @current_node.left
  #     @last_node, @current_node = @current_node, @current_node.right
  #     return @last_node
  #   elsif @last_node == @current_node.right
  #     @last_node, @current_node = @current_node, @current_node.parent
  #     return @last_node
  #   else
  #     @last_node, @current_node = @current_node.right, @current_node.parent
  #     return @last_node
  #   end
  # end

  def next_node
    if @current_node.left && @current_node.left != @last_node
      @current_node = get_bottom_left(@curent_node)
      @last_node, @current_node = @current_node, @last_node.parent
      return @last_node
    elsif @current_node.left && @current_node.left == @last_node
      @last_node, @current_node = 
    if @current_node.right  
      @last_node, @current_node = @current_node, @current_node.right
      return @last_node
    elsif @current.node.nil?

  end
end





# def traverse(root)
#   output = []
#   current_node = root
#   right_most = root
#   is_left = true
#   is_parent = false
#   while right_most.right
#     right_most = right_most.right
#   end

#   while current_node.left
#     current_node = current_node.left
#   end

#   until current_node == right_most
#     output << current_node
#     if is_left
#       current_node = current_node.parent
#       is_left = false
#       is_parent = true
#     elsif is_parent
#       current_node = current_node.right
#       is_parent = false
#     else 
#       current_node = curent_node.parent.parent
#       is_left = true
#     end
#   end

# end