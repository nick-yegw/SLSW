 class Tree
  attr_accessor :children, :name

  def initialize(name, children=[])
    @children = children
    @name = name
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    @children.each {|c| c.visit_all &block}
  end

end


ruby_tree = Tree.new('ruby',
                     [Tree.new('ruby_a'), Tree.new('ruby_b'), Tree.new('ruby_c'), Tree.new('ruby_c')])

puts "Visit current node of ruby_tree:"

ruby_tree.visit {|node| puts node.name}

puts "Visit all nodes of ruby_tree:"
ruby_tree.visit_all {|node| puts node.name}
