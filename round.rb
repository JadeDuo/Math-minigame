class Round

  def initialize(player)
    num1 = get_random_number
    num2 = get_random_number
    @sum = num1 + num2
    
    puts "--- NEW ROUND ---"

    puts "#{player.name}: What does #{num1} plus #{num2} equal?"
    print "> "

    @answer = $stdin.gets.chomp.to_i
  end

  def get_random_number
    rand(10)
  end

  def answer_correct?
    if @answer === @sum
      puts "--- "
      puts "That's correct!"
      return true
    else 
      puts "--- "
      puts "Wrong! Your opponent uppercuts you."
      return false
    end
  end
  
end