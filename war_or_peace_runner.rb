require './lib/standard_deck'
require './lib/deck'
require './lib/player'
require './lib/turn'

def split_deck
  cards = StandardDeck.new
  shuffled_deck = cards.create_standard_deck.shuffle
  @deck1 = Deck.new(shuffled_deck[0..25])
  @deck2 = Deck.new(shuffled_deck[26..52])
end

def create_two_players
  split_deck
  @player1 = Player.new("Angel", @deck1)
  @player2 = Player.new("Chris", @deck2)
end

def take_turn
  create_two_players
  @turns << Turn.new(@player1, @player2)
end

def start
  puts "Welcome to War! (or Peace) This game will be played with 52 cards."
  puts "The players today are #{@player1.name} and #{@player2.name}."
  puts "Type 'GO' to start the game!"
  50.times do
    print "-"
  end
end

create_two_players
start
