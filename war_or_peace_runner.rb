require './lib/turn'

def deck1
  deck1 = []
end

def deck2
  deck1 = []
end

def standard_deck
  standard_deck = [
    @card1 = Card.new(:heart, 'One', 1),
    @card2 = Card.new(:heart, 'Two', 2),
    @card3 = Card.new(:heart, 'Three', 3),
    @card4 = Card.new(:heart, 'Four', 4),
    @card5 = Card.new(:heart, 'Five', 5),
    @card6 = Card.new(:heart, 'Six', 6),
    @card7 = Card.new(:heart, 'Seven', 7),
    @card8 = Card.new(:heart, 'Eight', 8),
    @card9 = Card.new(:heart, 'Nine', 9),
    @card10 = Card.new(:heart, 'Ten', 10),
    # @card11 = Card.new(:heart, 'Jack', 11),
    # @card12 = Card.new(:heart, 'Queen', 12),
    # @card13 = Card.new(:heart, 'King', 13),
    # @card14 = Card.new(:heart, 'Ace', 14),
    # @card15 = Card.new(:spade, 'One', 1),
    # @card16 = Card.new(:spade, 'Two', 2),
    # @card17 = Card.new(:spade, 'Three', 3),
    # @card18 = Card.new(:spade, 'Four', 4),
    # @card19 = Card.new(:spade, 'Five', 5),
    # @card20 = Card.new(:spade, 'Six', 6),
    # @card21 = Card.new(:spade, 'Seven', 7),
    # @card22 = Card.new(:spade, 'Eight', 8),
    # @card23 = Card.new(:spade, 'Nine', 9),
    # @card24 = Card.new(:spade, 'Ten', 10),
    # @card25 = Card.new(:spade, 'Jack', 11),
    # @card26 = Card.new(:spade, 'Queen', 12),
    # @card27 = Card.new(:spade, 'King', 13),
    # @card28 = Card.new(:spade, 'Ace', 14),
    # @card29 = Card.new(:club, 'One', 1),
    # @card30 = Card.new(:club, 'Two', 2),
    # @card31 = Card.new(:club, 'Three', 3),
    # @card32 = Card.new(:club, 'Four', 4),
    # @card33 = Card.new(:club, 'Five', 5),
    # @card34 = Card.new(:club, 'Six', 6),
    # @card35 = Card.new(:club, 'Seven', 7),
    # @card36 = Card.new(:club, 'Eight', 8),
    # @card37 = Card.new(:club, 'Nine', 9),
    # @card38 = Card.new(:club, 'Ten', 10),
    # @card39 = Card.new(:club, 'Jack', 11),
    # @card40 = Card.new(:club, 'Queen', 12),
    # @card41 = Card.new(:club, 'King', 13),
    # @card42 = Card.new(:club, 'Ace', 14),
    # @card43 = Card.new(:diamond, 'One', 1),
    # @card44 = Card.new(:diamond, 'Two', 2),
    # @card45 = Card.new(:diamond, 'Three', 3),
    # @card46 = Card.new(:diamond, 'Four', 4),
    # @card47 = Card.new(:diamond, 'Five', 5),
    # @card48 = Card.new(:diamond, 'Six', 6),
    # @card49 = Card.new(:diamond, 'Seven', 7),
    # @card50 = Card.new(:diamond, 'Eight', 8),
    # @card51 = Card.new(:diamond, 'Nine', 9),
    # @card52 = Card.new(:diamond, 'Ten', 10),
    # @card53 = Card.new(:diamond, 'Jack', 11),
    # @card54 = Card.new(:diamond, 'Queen', 12),
    # @card55 = Card.new(:diamond, 'King', 13),
    # @card56 = Card.new(:diamond, 'Ace', 14),
  ]
  standard_deck.shuffle!
  4.times do
    standard_deck.shift
  end
  26.times do
    self.deck1 << self.standard_deck.shift
  end
end

def game_input
  input = gets.chomp
  if input == 'GO'
    start_game
  elsif input =='QUIT' or input == 'EXIT'
    quit_game
  else
    p " #{input} is not a valid input. Type 'GO' to start the game"
    self.game_input
  end
end

def start_game
  p self.deck1
  p self.deck2
  game_input
end

def quit_game
end

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Meegan and André."
p "Type 'GO' to start the game!"
p "-" * 15

game_input
