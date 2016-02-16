class Game
  attr_accessor :player_one_choice, :computer, :player_one_name, :computer_name, :winner, :winning_choice

  def initialize
    self.player_one_name = "Player"
    self.computer_name = "Computer"
    self.winner = ""
    self.winning_choice = ""
  end

  def play
    puts "=============================================="
    puts ""
    answer = ""
    until (["play", "p", "quit", "q", "run", "r"].include? answer) do
      puts "Play, run simulation, or quit. ('play' / 'run' / 'quit')"
      answer = gets.chomp.downcase
    end

    if (answer == "play" || answer == "p")
      play_user
    elsif (answer == "run" || answer == "r")
      run_simulation
    end

  end

  def play_user
    self.player_one_choice = ""
    self.player_one_name = "Player"
    get_user_choice
    get_computer_choice
    determine_winner

    output_msg = "#{self.player_one_name}: #{self.player_one_choice.upcase} vs #{self.computer_name}: #{self.computer.upcase} -----"
    if self.winner == "TIE"
      puts "#{output_msg} TIE"
    else
      puts "#{output_msg} #{winner} WINS"
    end
    play
  end

  def get_user_choice
    until (["rock", "paper", "scissors"].include? self.player_one_choice) do
      puts "Chose rock, paper, or scissors."
      self.player_one_choice = gets.chomp.downcase
    end
  end

  def get_computer_choice
    self.computer = ["rock", "paper", "scissors"].sample
  end

  def determine_winner

    if self.player_one_choice == self.computer
      self.winner = "TIE"
    else
      if self.player_one_choice == "rock"
        if self.computer == "scissors"
          self.winner = self.player_one_name.upcase
        else
          self.winner = self.computer_name.upcase
        end
      elsif self.player_one_choice == "paper"
        if self.computer == "rock"
          self.winner = self.player_one_name.upcase
        else
          self.winner = self.computer_name.upcase
        end
      else # player = scissors
        if self.computer == "paper"
          self.winner = self.player_one_name.upcase
        else
          self.winner = self.computer_name.upcase
        end
      end
    end

    if self.winner == self.player_one_name.upcase
      self.winning_choice = self.player_one_choice
    elsif self.winner == self.computer_name.upcase
      self.winning_choice = self.computer
    else
      self.winning_choice = "TIE"
    end
  end

  def run_simulation
    self.player_one_name = "Player (auto)"
    tie_count = 0
    rock_count = 0
    paper_count = 0
    scissors_count = 0

    (1..1000).each do
      self.player_one_choice = get_computer_choice
      get_computer_choice
      determine_winner
      case self.winning_choice
      when "TIE"; tie_count += 1
      when "rock"; rock_count += 1
      when "paper"; paper_count += 1
      when "scissors"; scissors_count += 1
      end
    end

    puts "Ties: #{tie_count} (#{100*(tie_count/1000.00).round(2)}%)"
    puts "Rock: #{rock_count} (#{100*(rock_count/1000.00).round(2)}%)"
    puts "Paper: #{paper_count} (#{100*(paper_count/1000.00).round(2)}%)"
    puts "Scissors: #{scissors_count} (#{100*(scissors_count/1000.00).round(2)}%)"

    play

  end

end

game = Game.new
game.play
