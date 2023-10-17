require './classes/player'
require './classes/questions'


# The `Game` class handles the main game logic, from initializing players to 
# determining the game's end.
class Game

  # When an instance of the `Game` class is created, the `initialize` method 
  # is called. It sets up players and sets the `@current_player` to Player 1.
  def initialize
    setup_players
    @current_player = @player1
  end

  # `setup_players` method creates two new instances of the Player class 
  # (player1 and player2) and asks for their names.
  def setup_players
    @player1 = Player.new
    puts "Player 1:"
    @player1.get_name
    
    @player2 = Player.new
    puts "Player 2:"
    @player2.get_name
  end

  # The `start` method begins the game loop, where it checks if the game 
  # is over. If it's not, it will execute the play_turn method.
  def start
    while !game_over?
      play_turn
    end
    display_winner
  end

  # The `play_turn` method manages a single turn for the current player. 
  # It asks a question, gets an answer, and checks if the answer is correct.
  def play_turn
    question = Question.new
    puts question.display_question
    answer = gets.chomp.to_i
    if question.correct_answer?(answer)
      puts "Correct!!!!"
    else
      @current_player.decrease_life
      puts "WRONG WRONG WRONG STINKY #{@current_player.player_name} Has #{@current_player.lives} lives left"
      
      # After decreasing the life, checks if the game is over.
      if game_over?
        return # exits `play_turn` early if the game is over
      end
    end
    
    # If the game isn't over, it switches the current player and announces whose turn it is.
    switch_player
    puts "-----NEW TURN-----"
    puts "#{@current_player.player_name}'s turn. They have #{@current_player.lives} trys left."
  end

  # The `switch_player` method toggles the `@current_player` between player1 and player2.
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # The `game_over?` method checks if any of the players has 0 lives left, 
  # signaling the end of the game.
  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  # The `display_winner` method identifies which player still has lives left 
  # and announces them as the winner.
  def display_winner
    winner = @player1.lives == 0 ? @player2 : @player1
    puts "#{winner.player_name} wins!"
  end
end


