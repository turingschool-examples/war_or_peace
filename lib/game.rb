require './lib/player'
class Game
  attr_reader :player1,
              :player2,
              :deck,
              :deck1,
              :deck2

  def initialize
    @deck = Deck.new(create_deck.shuffle)
    @deck1 = Deck.new(@deck.cards.slice(0..25))
    @deck2 = Deck.new(@deck.cards.slice(26..51))
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
  end

  def create_deck
    deck = []
    suits = %i[heart club diamond spade]
    ranks = {
      "2" => 2,
      "3" => 3,
      "4" => 4,
      "5" => 5,
      "6" => 6,
      "7" => 7,
      "8" => 8,
      "9" => 9,
      "10" => 10,
    "jack" => 11,
    "queen" => 12,
    "king" => 13,
    "ace" => 14
    }
    suits.flat_map do |suit|
      ranks.map do |rank, i|
        deck << Card.new(suit, rank, i)
      end
    end
    deck
  end

  def intro
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    
  end
end
