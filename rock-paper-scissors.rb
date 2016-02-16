class Game
  attr_accessor :player_one_choice, :computer, :player_one_name, :computer_name, :winner, :winning_choice

  def initialize
    self.player_one_name = "Player"
    self.computer_name = "Computer"
    self.winner = ""
    self.winning_choice = ""
  end

  def play
    
    case self.player_one_choice
    when self.computer
      self.winner = "TIE"
    when "rock"
      if self.computer == "scissors"
        self.winner = self.player_one_name.upcase
      else
        self.winner = self.computer_name.upcase
      end
    when "paper"
      if self.computer == "rock"
        self.winner = self.player_one_name.upcase
      else
        self.winner = self.computer_name.upcase
      end
    when "scissors"
      if self.computer == "paper"
        self.winner = self.player_one_name.upcase
      else
        self.winner = self.computer_name.upcase
      end
    end

    case self.winner
    when self.player_one_name.upcase; self.winning_choice = self.player_one_choice
    when self.computer_name.upcase; self.winning_choice = self.computer
    when "TIE"; self.winning_choice = "TIE"
    end
  end

  def get_computer_choice
    self.computer = ["rock", "paper", "scissors"].sample
  end

end



def play_game
  game = Game.new

  choice = ""
  until (["rock", "paper", "scissors"].include? choice) do
    puts "Chose rock, paper, or scissors."
    choice = gets.chomp.downcase
  end

  game.player_one_choice = choice
  game.get_computer_choice

  game.play

  output_msg = "#{game.player_one_name}: #{game.player_one_choice.upcase} vs #{game.computer_name}: #{game.computer.upcase} -----"
  if game.winner == "TIE"
    puts "#{output_msg} TIE"
  else
    puts "#{output_msg} #{game.winner} WINS"
  end
end

def run_simulation
  wins = []

  (1..1000).each do
    game = Game.new
    game.player_one_choice = game.get_computer_choice
    game.get_computer_choice
    game.play
    case game.winning_choice
    when "TIE"; wins << "tie"
    when "rock"; wins << "rock"
    when "paper"; wins << "paper"
    when "scissors"; wins << "scissors"
    end
  end

  puts "Ties: #{wins.count("tie")} (#{100*(wins.count("tie")/1000.00).round(2)}%)"
  puts "Rock: #{wins.count("rock")} (#{100*(wins.count("rock")/1000.00).round(2)}%)"
  puts "Paper: #{wins.count("paper")} (#{100*(wins.count("paper")/1000.00).round(2)}%)"
  puts "Scissors: #{wins.count("scissors")} (#{100*(wins.count("scissors")/1000.00).round(2)}%)"
end


answer = ""
while true do
  puts ""
  puts "Play, run simulation, or quit. ('play' / 'run' / 'quit')"
  answer = gets.chomp.downcase

  play_game if (answer == "play" || answer == "p")
  run_simulation if (answer == "run" || answer == "r")
  break if (answer == "quit" || answer == "q")
end
