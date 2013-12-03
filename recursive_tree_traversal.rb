
def traverse(root)
  return nil if root.nil?
  left = traverse(root.left) || []
  right = traver(root.right) || []
  left + root + right
end