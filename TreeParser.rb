require 'tree'

module TreeParser
  def self.ParseTabTree(tab_tree)
    lines = []
    # parse string into lines, saving tab indent
    tab_tree.each_line do |line|
      tabs = line.split("\t")
      indent = tabs.size
      name = tabs.last.strip
      lines << {:indent => indent, :node => Tree::TreeNode.new(name)}
    end
    
    # find the parent of each node
    (0..lines.size-1).each do |i|
      parent = i-1
      while (lines[i][:indent] <= lines[parent][:indent]) && (parent > 0)
        parent = parent - 1
      end
      lines[i][:parent] = parent
    end

    # create tree
    tree = Tree::TreeNode.new("ROOT")
    (0..lines.size-1).each do |i|
      tree << lines[i][:node] if lines[i][:parent] == -1
      lines.each do |line|
        lines[i][:node] << line[:node] if line[:parent] == i
      end
    end

    tree
  end
end

tab_tree =  "Family"
tab_tree << "\n\tParent1"
tab_tree << "\n\t\tChild1"
tab_tree << "\n\t\tChild2"
tab_tree << "\n\t\t\tGrandchild1"
tab_tree << "\n\t\t\tGrandchild2"
tab_tree << "\n\t\tChild3"
tab_tree << "\n\tParent2"
tab_tree << "\n\t\tChild4"

tree = TreeParser::ParseTabTree tab_tree
tree.print_tree
