require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class Game
  attr_reader :player1,
              :player2,
              :full_deck,
              :turn_count

  def initialize #(player1, player2)
    @player1 #= player2
    @player2 #= player2
    @full_deck = []
    @turn_count = 0

  end

  def make_deck
    @card1 = Card.new(:diamond, "Ace", 14)
    @card2 = Card.new(:diamond, "2", 2)
    @card3 = Card.new(:diamond, "3", 3)
    @card4 = Card.new(:diamond, "4", 4)
    @card5 = Card.new(:diamond, "5", 5)
    @card6 = Card.new(:diamond, "6", 6)
    @card7 = Card.new(:diamond, "7", 7)
    @card8 = Card.new(:diamond, "8", 8)
    @card9 = Card.new(:diamond, "9", 9)
    @card10 = Card.new(:diamond, "10", 10)
    @card11 = Card.new(:diamond, "Jack", 11)
    @card12 = Card.new(:diamond, "Queen", 12)
    @card13 = Card.new(:diamond, "King", 13)

    @card14 = Card.new(:heart, "Ace", 14)
    @card15 = Card.new(:heart, "2", 2)
    @card16 = Card.new(:heart, "3", 3)
    @card17 = Card.new(:heart, "4", 4)
    @card18 = Card.new(:heart, "5", 5)
    @card19 = Card.new(:heart, "6", 6)
    @card20 = Card.new(:heart, "7", 7)
    @card21 = Card.new(:heart, "8", 8)
    @card22 = Card.new(:heart, "9", 9)
    @card23 = Card.new(:heart, "10", 10)
    @card24 = Card.new(:heart, "Jack", 11)
    @card25 = Card.new(:heart, "Queen", 12)
    @card26 = Card.new(:heart, "King", 13)

    @card27 = Card.new(:club, "Ace", 14)
    @card28 = Card.new(:club, "2", 2)
    @card29 = Card.new(:club, "3", 3)
    @card30 = Card.new(:club, "4", 4)
    @card31 = Card.new(:club, "6", 5)
    @card32 = Card.new(:club, "6", 6)
    @card33 = Card.new(:club, "7", 7)
    @card34 = Card.new(:club, "8", 8)
    @card35 = Card.new(:club, "9", 9)
    @card36 = Card.new(:club, "10", 10)
    @card37 = Card.new(:club, "Jack", 11)
    @card38 = Card.new(:club, "Queen", 12)
    @card39 = Card.new(:club, "King", 13)

    @card40 = Card.new(:spade, "Ace", 14)
    @card41 = Card.new(:spade, "2", 2)
    @card42 = Card.new(:spade, "3", 3)
    @card43 = Card.new(:spade, "4", 4)
    @card44 = Card.new(:spade, "5", 5)
    @card45 = Card.new(:spade, "6", 6)
    @card46 = Card.new(:spade, "7", 7)
    @card47 = Card.new(:spade, "8", 8)
    @card48 = Card.new(:spade, "9", 9)
    @card49 = Card.new(:spade, "10", 10)
    @card50 = Card.new(:spade, "Jack", 11)
    @card51 = Card.new(:spade, "Queen", 12)
    @card52 = Card.new(:spade, "King", 13)

    @full_deck = Deck.new([@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8, @card9, @card10, @card11, @card12, @card13, @card14, @card15, @card16, @card17, @card18, @card19, @card20, @card21, @card22, @card23, @card24, @card25, @card26, @card27, @card28, @card29, @card30, @card31, @card32, @card33, @card34, @card35, @card36, @card37, @card38, @card39, @card40, @card41, @card42, @card43, @card44, @card45, @card46, @card47, @card48, @card49, @card50, @card51, @card52])
  end

  # def add_players
  #   @player1 =
  # end


  def shuffle_deck
    @full_deck.cards.shuffle

  end

  def split_deck
    @deck1 = []
    @deck2 = []

    @shuffled_deck = @full_deck.cards.shuffle
    @deck1.push(@shuffled_deck[0..25])
    @deck2.push(@shuffled_deck[26..51])
    # # @deck1.flatten

    # 26.times do
    #   @deck1 << @shuffled_deck.remove_card
    # end
    #
    # 26.times do
    #   @deck2 << @shuffled_deck.remove_card
    # end


    # @deck2.flatten
    # binding.pry
  end

  # def start
  #   turn = Turn.new(player1, player2)
  #   winner = Turn.winner
  #   turn.pile_cards
  #   turn.award_spoils(winner)
  #   until player1.has_lost? || player2.has_lost? || turn_count  == 1000001
  #     if type == "basic"
  #       p "Basic - #{player.name} won 2 cards"
  #     elsif type == "War"
  #       p "War- #{player.name} won 6 cards"
  #     elsif type == :mutually_assured_destruction
  #       p "Mutual Destruction - 6 cards removed from deck"
  #     end
  #
  #     @turn_count += 1
  #   end
  #
  #   if player.has_lost?
  #     p "#{player1.name} has won!"
  #   end
  # end
  #
  # def takes_turn
  #
  # end
end
#
# game = Game.new #(player1, player2)
#
# game.make_deck
# game.split_deck
