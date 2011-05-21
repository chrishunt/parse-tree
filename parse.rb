require 'ruby-debug'
require 'tree'

tab_tree = "Parent1\n\tChild1\n\tChild2\n\t\tChild2-1\n\tChild3\nParent2"
puts tab_tree + "\n\n"

tree = Tree::TreeNode.new("Family")
stack = []
stack.push tree

current_index = 0
previous_node = tree

tab_tree.split("\n").each do |line|
  tabs = line.strip.split("\t")
  node_index = tabs.size
  puts "current_index: #{current_index}, node_index: #{node_index}"
  puts stack.size
  current_node = Tree::TreeNode.new(tabs.last)
  if node_index > current_index
    stack.push previous_node
    current_index = node_index
  elsif node_index < current_index
    stack.pop
    current_index = node_index
  end

  stack.last << current_node
  debugger
  previous_node = current_node

end

tree.print_tree
