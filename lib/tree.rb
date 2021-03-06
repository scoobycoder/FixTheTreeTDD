class NoApplesError < StandardError;
end

class Tree
  attr_reader :apples, :age, :height

  def initialize(start_apples)
    @apples = []
    @apples << start_apples
    @age = 0
    @height = 10
  end

  def add_apples
    @apples << Apple.new('green', 10)
  end

  def any_apples?
    @apples.length > 0
  end

  def pick_an_apple!
    raise NoApplesError, 'This tree has no apples' unless self.any_apples?
    @apples.pop
  end

  def age!
    @age += 1
  end

  def dead?
    @age > 200
  end

end

class AppleTree < Tree

  def initialize(start_apples)
    super(start_apples)
  end

end


class Fruit
  def initialize
    has_seeds = true
  end
end

class Apple < Fruit
  attr_reader :diameter, :color

  def initialize(color, diameter)
    @diameter = diameter
    @color = color
  end

end

#THERES ONLY ONE THING YOU NEED TO EDIT BELOW THIS LINE
# avg_diameter (line 58) will raise an error.
# it should calculate the diameter of the apples in the basket

def tree_data
  tree = Tree.new(Apple.new('green', 4))

  apple_count = 0

  tree.age! until tree.any_apples?

  puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

  until tree.dead?
    basket = []

    # It places the apple in the basket
    while tree.any_apples?
      basket << tree.pick_an_apple!
    end

    diameter_sum = 0

    basket.each do |apple|
      diameter_sum += apple.diameter
      apple_count += 1
    end

    avg_diameter = diameter_sum / apple_count
        puts "Year #{tree.age} Report"
    puts "Tree height: #{tree.height} feet"
    puts "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter} inches"
    puts ""

    # Ages the tree another year
    tree.age!
  end

  puts "Alas, the tree, she is dead!"
end

# Uncomment this line to run the script, but BE SURE to comment it before you try to run your tests!
tree_data
