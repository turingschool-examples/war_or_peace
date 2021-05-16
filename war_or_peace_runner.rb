require './lib/turn'
require './lib/game'

@game = Game.new

def standard_deck
  @cards1 = []
  @cards2 = []
  standard_deck = [
    @card1 = Card.new(:heart, 'Two', 2),
    @card2 = Card.new(:heart, 'Three', 3),
    @card3 = Card.new(:heart, 'Four', 4),
    @card4 = Card.new(:heart, 'Five', 5),
    @card5 = Card.new(:heart, 'Six', 6),
    @card6 = Card.new(:heart, 'Seven', 7),
    @card7 = Card.new(:heart, 'Eight', 8),
    @card8 = Card.new(:heart, 'Nine', 9),
    @card9 = Card.new(:heart, 'Ten', 10),
    @card10 = Card.new(:heart, 'Jack', 11),
    @card11 = Card.new(:heart, 'Queen', 12),
    @card12 = Card.new(:heart, 'King', 13),
    @card13 = Card.new(:heart, 'Ace', 14),
    @card14 = Card.new(:spade, 'Two', 2),
    @card15 = Card.new(:spade, 'Three', 3),
    @card16 = Card.new(:spade, 'Four', 4),
    @card17 = Card.new(:spade, 'Five', 5),
    @card18 = Card.new(:spade, 'Six', 6),
    @card19 = Card.new(:spade, 'Seven', 7),
    @card20 = Card.new(:spade, 'Eight', 8),
    @card21 = Card.new(:spade, 'Nine', 9),
    @card22 = Card.new(:spade, 'Ten', 10),
    @card23 = Card.new(:spade, 'Jack', 11),
    @card24 = Card.new(:spade, 'Queen', 12),
    @card25 = Card.new(:spade, 'King', 13),
    @card26 = Card.new(:spade, 'Ace', 14),
    @card27 = Card.new(:club, 'Two', 2),
    @card28 = Card.new(:club, 'Three', 3),
    @card29 = Card.new(:club, 'Four', 4),
    @card30 = Card.new(:club, 'Five', 5),
    @card31 = Card.new(:club, 'Six', 6),
    @card32 = Card.new(:club, 'Seven', 7),
    @card33 = Card.new(:club, 'Eight', 8),
    @card34 = Card.new(:club, 'Nine', 9),
    @card35 = Card.new(:club, 'Ten', 10),
    @card36 = Card.new(:club, 'Jack', 11),
    @card37 = Card.new(:club, 'Queen', 12),
    @card38 = Card.new(:club, 'King', 13),
    @card39 = Card.new(:club, 'Ace', 14),
    @card40 = Card.new(:diamond, 'Two', 2),
    @card41 = Card.new(:diamond, 'Three', 3),
    @card42 = Card.new(:diamond, 'Four', 4),
    @card43 = Card.new(:diamond, 'Five', 5),
    @card44 = Card.new(:diamond, 'Six', 6),
    @card45 = Card.new(:diamond, 'Seven', 7),
    @card46 = Card.new(:diamond, 'Eight', 8),
    @card47 = Card.new(:diamond, 'Nine', 9),
    @card48 = Card.new(:diamond, 'Ten', 10),
    @card49 = Card.new(:diamond, 'Jack', 11),
    @card50 = Card.new(:diamond, 'Queen', 12),
    @card51 = Card.new(:diamond, 'King', 13),
    @card52 = Card.new(:diamond, 'Ace', 14),
  ]
  standard_deck.shuffle!
  26.times do
    @cards1 << standard_deck.shift
    @cards2 << standard_deck.shift
  end
  @deck1 = Deck.new(@cards1)
  @deck2 = Deck.new(@cards2)
  @player1 = Player.new("Meegan", @deck1)
  @player2 = Player.new("André", @deck2)
end

def game_input
  input = gets.chomp.upcase
  if input == 'GO'
    start_game
  elsif input =='QUIT' or input == 'EXIT'
    quit_game
  else
    p " '#{input}' is not a valid input. Type 'GO' to start the game"
    self.game_input
  end
end

def start_game
  standard_deck
  # p @deck1
  # p @deck2
  @game.start
  game_input
end

def quit_game
  p "Good Bye!"
end

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Meegan and André."
p "Type 'GO' to start the game!"
p "-" * 15

game_input
