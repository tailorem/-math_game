require_relative "player"

# Game
class Game
  attr_reader :p1, :p2
  attr_accessor :current_player

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @current_player = @p1
  end

  def start
    puts "GAME INITIALIZED"
    play_turn
  end

  # Changes player turn
  def new_turn
    @current_player = @current_player == p1 ? p2 : p1
  end

  # Displays winner and score
  def game_over(winner)
    puts "--------------- GAME OVER ---------------\n#{winner.name} wins with a score of #{winner.lives}/3\n-----------------------------------------"
  end

  # Question
  def question
    x = rand(1..20)
    y = rand(1..20)
    answer = x * y
    print "#{current_player.name}: what is #{x} * #{y}?\n> "
    input = gets.chomp.to_i
    answer == input
  end

  # Game Play
  def play_turn
    while (p1.lives > 0 && p2.lives > 0)
      puts "--------------- NEW TURN ---------------"
      answer = question
      if answer
        puts "You got it!"
      else
        @current_player.lose_life
      end
      puts "#{p1.name}: #{p1.lives}/3 vs #{p2.name}: #{p2.lives}/3"
      new_turn
    end
    game_over(@current_player)
  end
end

