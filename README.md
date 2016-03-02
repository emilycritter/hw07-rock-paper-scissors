# Ruby Fundamentals
## Rock Paper Scissors
###### Wednesday, February 17, 2016
At this point, you should be able to define classes that create objects with both behavior and data. The cononical version of this is the Rock Paper Scissors implementation.

![alt text][logo]

[logo]: http://i.imgur.com/TJ2o728.gif

Code outline for you to complete:

```
class Game
  attr_accessor :player_one_choice, :computer
end

game = Game.new
game.play
```

## Normal Mode
1. The game should ask player 1 for their choice of "rock", "paper", or "scissors". (use gets)
2. The game should then randomly select the computer's selection
3. The game then outputs who won in this format: "Player: ROCK vs Computer: SCISSORS ----- PLAYER WINS"
4. Rock beats scissors
5. Paper beats Rock
6. Scissors beats Paper

## Epic Mode
1. Instead of asking the player for their choice, have the computer automatically randomly select both the player and computer
2. Run the simulation 1000 times
3. Track who which choice wins the most often
