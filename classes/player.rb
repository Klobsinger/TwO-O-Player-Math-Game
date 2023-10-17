# The Player class represents an individual player in the game.
# Each player has a name and a certain number of lives.
class Player
  
  # Provides read and write access to the lives and player_name attributes.
  attr_accessor :lives
  attr_reader :player_name

  # When a `Player` instance is created, this method sets the initial values
  # for the player's attributes: 3 lives and a nil player_name.
  def initialize
    @lives = 3
    @player_name = nil
  end
  
  # Prompts the player for their name and stores it.
  def get_name
    puts "What is your name?"
    @player_name = gets.chomp
  end

  # Decreases the player's life count by 1.
  def decrease_life
    @lives -= 1
  end
end
