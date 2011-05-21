require 'ruby-debug'
require 'tree'

tab_tree =  "Family"
tab_tree << "\n\tParent1"
tab_tree << "\n\t\tChild1"
tab_tree << "\n\t\tChild2"
tab_tree << "\n\t\t\tGrandchild1"
tab_tree << "\n\t\t\tGrandchild2"
tab_tree << "\n\t\tChild3"
tab_tree << "\n\tParent2"
tab_tree << "\n\t\tChild4"

puts tab_tree
