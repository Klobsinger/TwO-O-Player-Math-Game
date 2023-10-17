# The `Question` class is responsible for generating and handling 
# questions that are posed to the players during the game.
class Question

  # Provides read access to the answer attribute.
 attr_reader :answer

  # When an instance of `Question` is created, this method will be called.
  # It generates two random numbers between 1 and 20, and calculates their sum.
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end

  # Returns a string representation of the question.
  def display_question
    "What is #{@num1} plus #{@num2}?"
  end

  # Checks if the player's answer matches the correct answer.
  # Returns `true` if they match and `false` otherwise.
  def correct_answer?(player_answer)
    player_answer == @answer
  end
end