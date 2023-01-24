class Game
  attr_accessor

  def initialize
    puts "Welcome to Math Challenge! Who will be P1?"
    print "> "

    p1_name = $stdin.gets.chomp
    @player1 = Player.new(p1_name)

    puts "Hello #{@player1.name}! Who will be P2?"
    print "> "

    p2_name = $stdin.gets.chomp
    @player2 = Player.new(p2_name)

    puts "Our challengers today are #{@player1.name} and #{@player2.name}, let's get started!"

    @current_player = @player1
    start_new_round(@current_player)
  end

  def change_player(current_player)
    if current_player === @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def start_new_round(current_player)
    new_round = Round.new(current_player)

    if !new_round.answer_correct?
      @current_player.lose_life
      if @current_player.lives === 0
        game_over
      else 
        puts "--- "
        puts "That's gotta hurt! : #{@player1.name} #{@player1.lives} VS #{@player2.name} #{@player2.lives}"
        change_player(@current_player)
        start_new_round(@current_player)
      end
    else
      puts "--- "
      puts "No change after that one! : #{@player1.name} has #{@player1.lives} VS #{@player2.name} has #{@player2.lives}"
      change_player(@current_player)
      start_new_round(@current_player)
    end
  end

  def game_over
    puts "--- "
    puts "AND THAT'S THE MATCH!"

    if @current_player === @player1
      puts "#{@player1.name} has lost their final life! #{@player2.name} wins!"
      puts "#{@player2.name} is our champion with #{@player2.lives}/3 lives remaining!"
    else 
      puts "#{@player2.name} has lost their final life! #{@player1.name} wins!"
      puts "#{@player1.name} is our champion with #{@player1.lives}/3 lives remaining!"
    end
  end 

end  