# Player
class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
    puts "NOPE! #{name} loses a life!"
  end
end

