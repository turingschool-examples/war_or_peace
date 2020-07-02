require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



class Game
  attr_reader :player1, :player2, :turn_number, :turn, :spoils_of_war
  $turn_number = 0

  def initialize
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def start
    suits = %i[spades hearts diamonds clubs]
    ranks = %i[Ace two three four five six seven eight nine ten Jack Queen King]
    values = {
      :Ace => 1,
      :two => 2,
      :three => 3,
      :four => 4,
      :five => 5,
      :six => 6,
      :seven => 7,
      :eight => 8,
      :nine => 9,
      :ten => 10,
      :Jack => 11,
      :Queen => 12,
      :King => 13
    }

    fdeck = ranks.map {|rank| suits.map {|suit| values.map{ |rank, value| Card.new(suit, value, rank)  }  } }.flatten
    full_deck = fdeck.take(52)

    shuffled_deck = full_deck.shuffle
    #
    #
    deck1 = Deck.new(shuffled_deck.take(26))
    deck2 = Deck.new(shuffled_deck.drop(26))

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)



      if player1.deck.cards.length != 0 || player2.deck.cards.length != 0
        10.times{
          winner = turn.winner
          turn.award_spoils(winner)
          p "Turn #{$turn_number}: #{turn.winner} won #{turn.spoils_of_war.length} cards"
          $turn_number += 1
          p player1.deck.cards.length
          p player2.deck.cards.length

         }
      else
      puts "Draw"
      end
  end
end





puts "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
if gets.chomp!.downcase == 'go'
  new_game = Game.new
  new_game.start
else
  puts "Try putting 'go' or 'GO'."
end
