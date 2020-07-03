require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2, :turn_number, :turn, :spoils_of_war, :cards_won
  $turn_number = 0

  def initialize
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @cards_won = cards_won
  end

  def start
    suits = %i[spades hearts diamonds clubs]
    values = %i[Ace two three four five six seven eight nine ten Jack Queen King]
    ranks = {
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

    fdeck = values.map {|value| suits.map {|suit| ranks.map{ |value, rank| Card.new(suit, value, rank)  }  } }.flatten
    full_deck = fdeck.take(52)


    shuffled_deck = full_deck.shuffle

    #
    deck1 = Deck.new(shuffled_deck.take(26))
    deck2 = Deck.new(shuffled_deck.drop(26))

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    cards_won = @spoils_of_war.length
    turn = Turn.new(player1, player2)



    70.times{

      turn.type
      winner = turn.winner
      turn.winner
      turn.pile_cards
      turn.spoils_of_war
      turn.award_spoils(winner)

      if player1.deck.cards.length == 0 || player2.deck.cards.length == 0
        puts "#{turn.winner} won!"
        break
      end

      p "Turn #{$turn_number}: #{turn.type}-- #{turn.winner} won #{cards_won} cards."
      # p '------------------------player 1'
      # p turn.player1.deck.cards[0]
      # p turn.player1.deck.rank_of_card_at(0)
      # p '----------------------------player 2'
      # p turn.player2.deck.cards[0]
      # p turn.player2.deck.rank_of_card_at(0)
      # p "type"
      # p turn.type
      # p "winner"
      # p turn.winner
      # p turn.pile_cards
      # turn.award_spoils("Megan")
      # p player1.deck.cards.length
      # p 'Player 1 cards'
      # p player1.deck.cards
      # p 'Player 2 cards'
      # p player2.deck.cards
      p player1.deck.cards.length
      p player2.deck.cards.length
      # p player2.deck.cards
      $turn_number += 1
     }
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
