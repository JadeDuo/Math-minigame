class Player
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3

    puts "#{name} is ready for a challenge! 🧮"
  end

  def lose_life
    @lives -= 1
  end

end