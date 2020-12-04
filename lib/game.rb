require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game

  attr_reader :player1, :player2

  def initialize
    @deck = []
    @round_count = 1
    @deck1 = Deck.new([])
    @deck2 = Deck.new([])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def make_deck
    suit_rank = 1
    suit = {1 => :heart, 2 => :diamond, 3 => :spade, 4 => :club}

    card_rank = 2
    card_value = {
      2 => '2',
      3 => '3',
      4 => '4',
      5 => '5',
      6 => '6',
      7 => '7',
      8 => '8',
      9 => '9',
      10 => '10',
      11 => 'Jack',
      12 => 'Queen',
      13 => 'King',
      14 => 'Ace'}

    while suit_rank <= 4
      while card_rank <= 14
        @deck << Card.new(suit[suit_rank], card_value[card_rank], card_rank)
        card_rank += 1
      end
      suit_rank += 1
      card_rank = 2
    end
    @Shuffled_deck = @deck.shuffle
  end

  def deal
    26.times do
      @player1.deck.cards << @Shuffled_deck.shift
      @player2.deck.cards << @Shuffled_deck.shift
    end
  end

  def start
    make_deck
    deal
    begin_game
  end

  def begin_game
    loop do
      @turn = Turn.new(@player1, @player2)
      @turn.type
      @winner = @turn.winner
      print_to_screen
      @turn.pile_cards
      @turn.award_spoils
      @round_count += 1

      if @player1.has_lost? == true
        p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.has_lost? == true
        p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif @round_count == 1000001
        p "---- DRAW ----"
        break
      else
      end
    end
  end

  # def end_of_game
  #   if player1.has_lost? == true
  #     p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
  #     break
  #   elsif player2.has_lost? == true
  #     p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
  #     break
  #   elsif round_count == 100000
  #     p "---- DRAW ----"
  #     break
  #   else
  #   end
  # end

  def print_to_screen
    if @turn.type == :basic
      p "Turn #{@round_count}: #{@winner.name} won 2 cards. #{@player1.deck.cards.length} + #{@player2.deck.cards.length}"
    elsif @turn.type == :war
      p "Turn #{@round_count}: War - #{@winner.name} won 6 cards. #{@player1.deck.cards.length} + #{@player2.deck.cards.length}"
    else
      p "*mutually assured destruction* 6 cards removed from play #{@player1.deck.cards.length} + #{@player2.deck.cards.length}"
    end
  end
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  # puts """
  # Welcome to War! (or Peace) This game will be played with 52 cards.
  # The players today are #{player1.name} and #{player2.name}.
  # Type 'GO' to start the game!
  # ------------------------------------------------------------------
  # """
  #
  #
  #
  #
  #
  #
  # tern = Turn.new(player1, player2)
  # turn.type
  # winner = turn.winner
  # turn.pile_cards
  # turn.award_spoils
  # round_count += 1





end
