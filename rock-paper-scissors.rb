class Game
  attr_accessor :player_one_choice, :computer, :player_one_name, :computer_name

  def initialize
    self.player_one_name = "Player"
    self.computer_name = "Computer"
  end

  def play
    get_user_choice
    get_computer_choice
    determine_winner
  end

  def play_prompt
    self.player_one_choice = ""
    answer = ""
    puts "=============================================="
    puts ""
    until (["play", "p", "quit", "q", "run", "r"].include? answer) do
      puts "Play, quit, or run simulation. ('play' / 'quit' / 'run')"
      answer = gets.chomp.downcase
    end
    if (answer == "play" || answer == "p")
      play
    elsif (answer == "run" || answer == "r")
      run_simulation
    end
  end

  def get_user_choice
    until (["rock", "paper", "scissors"].include? self.player_one_choice) do
      puts "Chose rock, paper, or scissors."
      self.player_one_choice = gets.chomp.downcase
    end
  end

  def get_computer_choice
    self.computer = ["rock", "paper", "scissors"].sample
    # puts self.computer
  end

  def determine_winner
    output_msg = "#{self.player_one_name}: #{self.player_one_choice.upcase} vs #{self.computer_name}: #{self.computer.upcase} -----"
    winner = self.player_one_name.upcase

    if self.player_one_choice == self.computer
      puts "#{output_msg} TIE"
      winner = "TIE"
    else
      if self.player_one_choice == "rock"
        if self.computer != "scissors"
          winner = self.computer_name.upcase
        end
      elsif self.player_one_choice == "paper"
        if self.computer != "rock"
          winner = self.computer_name.upcase
        end
      else # player = scissors
        if self.computer != "paper"
          winner = self.computer_name.upcase
        end
      end
      puts "#{output_msg} #{winner} WINS"
    end
    return winner
  end

  def run_simulation
    self.player_one_name = "Player (auto)"
    tie_count = 0
    player_count = 0
    computer_count = 0

    (1..1000).each do
      self.player_one_choice = get_computer_choice
      get_computer_choice
      play
      if play == "TIE"
        tie_count += 1
      elsif play == self.player_one_name.upcase
        player_count += 1
      else
        computer_count += 1
      end
    end

    puts "Ties: #{tie_count} (#{100*(tie_count/1000.00).round(2)}%)"
    puts "#{self.player_one_name}: #{player_count} (#{100*(player_count/1000.00).round(2)}%)"
    puts "#{self.computer_name}: #{computer_count} (#{100*(computer_count/1000.00).round(2)}%)"
    play_prompt

  end

end

game = Game.new
game.play_prompt
