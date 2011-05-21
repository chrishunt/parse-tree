require 'ruby-debug'

module TreeParser
  def self.ParseTabTree(tab_tree)
    tab_tree
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

puts TreeParser::ParseTabTree tab_tree
