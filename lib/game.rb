class Game
  attr_reader :standard_deck, :deck1, :deck2, :player1, :player2
  def initialize
    @standard_deck = Deck.new
    @deck1 = Deck.new
    @deck2 = Deck.new

  end

  def intro
    p "Welcome to War! (or Peace) This game will be played with 52 cards.
    The players today are Megan and Aurora.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
    go = gets.chomp
  end

  def prepare_deck
    standard_deck.populate_standard_deck
    standard_deck.shuffle_deck
    standard_deck.cut_deck
    deck1.cards << standard_deck.cut_cards[0]
    deck1.cards.flatten!
    deck2.cards << standard_deck.cut_cards[1]
    deck2.cards.flatten!
  end

  def deal_cards(player1, player2)
    @player1 = Player.new(player1, deck1)
    @player2 = Player.new(player2, deck2)
  end

# Start method
# def start(player1, player2)
# prepare deck
# deal cards(player1, player2)
# print intro
# start turns


end
