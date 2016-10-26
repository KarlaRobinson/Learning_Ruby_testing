class LayingHen
  attr_accessor :age

  def initialize
    @age = 0
    @eggs = 0
    @hatched_hours = 0
  end

  def age!
    @age += 1
    @eggs += 4 if @age > 3
  end

  def any_eggs?
    @eggs > 0 ? true : false
  end

  def collect
    @eggs -= 1
    egg = Egg.new(@hatched_hours)
  end

  def old?
    @age > 10 ? true : false
  end

  def increase_hatched_hour(hours)
    @hatched_hours = hours
  end
end

class Egg

  def initialize(hatched_hours)
    @hatched_hours = hatched_hours
  end

  def rotten?
    @hatched_hours > 3 ? true : false
  end

end



################## APP ##################
# hen = LayingHen.new
# basket = []
# rotten_eggs = 0


# hen.age! until hen.any_eggs?

# puts "Hen is #{hen.age} months old, its starting to lay eggs."
# puts ""

# until hen.old?

#   # The time we take to pick up the eggs
#   hours = rand(5)
#   hen.increase_hatched_hour(hours)

#   while hen.any_eggs?
#     egg = hen.collect

#     if egg.rotten?
#       rotten_eggs += 1
#     else
#       basket << egg
#     end
#   end

#   puts "Month #{hen.age} Report"
#   puts "We took #{hours} hour(s) to pick the eggs"
#   puts "Eggs in the basket: #{basket.size}"
#   puts "Rotten eggs: #{rotten_eggs}"
#   puts ""

#   # Age the hen another month
#   hen.age!
# end

# puts "The hen is old, she can't lay more eggs!"
# puts "The hen laid #{basket.size + rotten_eggs} eggs"
# if rotten_eggs == 0
#   puts "CONGRATULATIONS NO ROTTEN EGGS" 
# else
#   puts "We pick #{rotten_eggs} eggs too late so they became rotten"
# end
