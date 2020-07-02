require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



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
shuffled_deck
#
#
deck1 = Deck.new(shuffled_deck.take(26))
deck2 = Deck.new(shuffled_deck.drop(26))

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

class Game
  attr_accessor :player1, :player2, :turn_number, :turn
  $turn_number = 0

  def initialize
    turn = Turn.new(player1, player2)
  end

  def start
    $turn_number += 1
  end


end

puts "Welcome to War! (or Peace) This game will be played with 52 cards. The players today are Megan and Aurora. Type 'GO' to start the game!"
p '------------------------------------------------------------------'

if gets.chomp!.downcase == 'go'
  @player1 = player1
  @player2 = player2

  while @player1.deck.cards.length > 0 || @player2.deck.cards.length > 0
      george = Game.new
      george.start
      turn = Turn.new(player1, player2)
      winner = turn.winner
      p "Turn #{$turn_number}: #{turn.winner} won #{@spoils_of_war} cards"
      def type
        @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) ? :basic : (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2) ? :war : :mutually_assured_destruction)
      end
      p @player1.deck.cards.length
      p @player2.deck.cards.length

      def winner
        if type == :basic
          @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) ? @player1.name : @player2.name
        elsif type == :war
          @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) ? @player1.name : @player2.name
        elsif type == :mutually_assured_destruction
          'No Winner'
        elsif @player1.deck.cards.length == 0 || @player1.deck.cards.length == 0
          "Game Over"
        end
      end

      def pile_cards
        if type == :basic
          @spoils_of_war << @player1.deck.cards.first && @spoils_of_war << @player2.deck.cards.first
        elsif type == :war
          @spoils_of_war << @player1.deck.cards[0] && @spoils_of_war << @player1.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2] && @spoils_of_war << @player2.deck.cards[0] && @spoils_of_war << @player2.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2]
        elsif @player1.deck.cards.length == 0 || @player1.deck.cards.length == 0
          "Game Over"
        end
      end

      def award_spoils(winner)
        if winner == 'Megan' && type == :basic
          @player1.deck.cards << @spoils_of_war
          @player2.deck.cards = @player2.deck.cards.drop(1)
          @player1.deck.cards = @player1.deck.cards.flatten.uniq.shuffle
        elsif winner == 'Aurora' && type == :basic
          @player2.deck.cards << @spoils_of_war
          @player1.deck.cards = @player1.deck.cards.drop(1)
          @player2.deck.cards = @player2.deck.cards.flatten.uniq.shuffle
        elsif winner == 'Megan' && type == :war
          @player1.deck.cards << @spoils_of_war
          @player2.deck.cards = @player2.deck.cards.drop(3)
          @player1.deck.cards = @player1.deck.cards.flatten.uniq.shuffle
        elsif winner == 'Aurora' && type == :war
          @player2.deck.cards << @spoils_of_war
          @player1.deck.cards = @player1.deck.cards.drop(3)
          @player2.deck.cards = @player2.deck.cards.flatten.uniq.shuffle
        elsif winner == 'No Winner' && type == :mutually_assured_destruction
          @player1.deck.cards = @player1.deck.cards.drop(3)
          @player2.deck.cards = @player2.deck.cards.drop(3)
        elsif @player1.deck.cards.length == 0 || @player1.deck.cards.length == 0
          "Game Over"
        end
      end

    end
  else
    p "No I meant, try typing the letters 'g' and 'o' together, with no space in between."
end
