require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

  class Game
    attr_reader :full_deck, :deck1, :deck2, :player1, :player2
    def initialize
      @full_deck = full_deck
      @deck1 = deck1
      @deck2 = deck2
      @player1 = player1
      @player2 = player2
    end

    def full_deck
      card1 = Card.new(:diamond, '2', 2)
      card2 = Card.new(:diamond, '3', 3)
      card3 = Card.new(:diamond, '4', 4)
      card4 = Card.new(:diamond, '5', 5)
      card5 = Card.new(:diamond, '6', 6)
      card6 = Card.new(:diamond, '7', 7)
      card7 = Card.new(:diamond, '8', 8)
      card8 = Card.new(:diamond, '9', 9)
      card9 = Card.new(:diamond, '10', 10)
      card10 = Card.new(:diamond, 'Jack', 11)
      card11 = Card.new(:diamond, 'Queen', 12)
      card12 = Card.new(:diamond, 'King', 13)
      card13 = Card.new(:diamond, 'Ace', 14)
      card14 = Card.new(:heart, '2', 2)
      card15 = Card.new(:heart, '3', 3)
      card16 = Card.new(:heart, '4', 4)
      card17 = Card.new(:heart, '5', 5)
      card18 = Card.new(:heart, '6', 6)
      card19 = Card.new(:heart, '7', 7)
      card20 = Card.new(:heart, '8', 8)
      card21 = Card.new(:heart, '9', 9)
      card22 = Card.new(:heart, '10', 10)
      card23 = Card.new(:heart, 'Jack', 11)
      card24 = Card.new(:heart, 'Queen', 12)
      card25 = Card.new(:heart, 'King', 13)
      card26 = Card.new(:heart, 'Ace', 14)
      card27 = Card.new(:spade, '2', 2)
      card28 = Card.new(:spade, '3', 3)
      card29 = Card.new(:spade, '4', 4)
      card30 = Card.new(:spade, '5', 5)
      card31 = Card.new(:spade, '6', 6)
      card32 = Card.new(:spade, '7', 7)
      card33 = Card.new(:spade, '8', 8)
      card34 = Card.new(:spade, '9', 9)
      card35 = Card.new(:spade, '10', 10)
      card36 = Card.new(:spade, 'Jack', 11)
      card37 = Card.new(:spade, 'Queen', 12)
      card38 = Card.new(:spade, 'King', 13)
      card39 = Card.new(:spade, 'Ace', 14)
      card40 = Card.new(:club, '2', 2)
      card41 = Card.new(:club, '3', 3)
      card42 = Card.new(:club, '4', 4)
      card43 = Card.new(:club, '5', 5)
      card44 = Card.new(:club, '6', 6)
      card45 = Card.new(:club, '7', 7)
      card46 = Card.new(:club, '8', 8)
      card47 = Card.new(:club, '9', 9)
      card48 = Card.new(:club, '10', 10)
      card49 = Card.new(:club, 'Jack', 11)
      card50 = Card.new(:clubclub, 'Queen', 12)
      card51 = Card.new(:club, 'King', 13)
      card52 = Card.new(:club, 'Ace', 14)
      @cards = [card1, card2, card3 ,card4, card5, card6, card7, card8, card9, card10, card11, card12,card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]

      @full_deck = Deck.new(@cards)
      # require 'pry'; binding.pry
    end

    def start
      p 'Welcome to War! (or Peace) This game will be played with 52 cards.'
      p 'The players today are Megan and Aurora.'
      p 'Type GO to start the game!'
      p '------------------------------------------------------------------'

      input = gets.chomp.upcase
      if input == 'GO'
        shuffle_deck
        split_deck
        add_players
        turns
      else
        p "Try Again"
        self.start
      end
    end

    def shuffle_deck
      @full_deck.cards.shuffle!
    end

    #this method will split the deck between two players
    def split_deck
      @deck1 = Deck.new(@full_deck.cards[0..25])
      @deck2 = Deck.new(@full_deck.cards[26..51])
    end

    #This adds both players to the game
    def add_players
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
    end

    def turns
      turn_count = 0

      loop do # do you have to have a final else statement at the end??
        @turn = Turn.new(@player1, @player2)
        turn_count += 1
        if @player1.has_lost? == true
          p '*~*~*~* Aurora has won the game! *~*~*~*'
          break
        elsif @player2.has_lost? == true
          p '*~*~*~* Megan has won the game! *~*~*~*'
          break
        elsif turn_count > 10000
          p '---- DRAW ----'
          break
        end

        p @player1.deck.cards[0]
        p @player2.deck.cards[0]

        @turn.type
        @current_turn = @turn.type
        @winner = @turn.winner
        @turn.pile_cards
        @turn.award_spoils(@winner)

        if @current_turn == :mutually_assured_destruction
          p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
        elsif @current_turn == :war
          p "Turn #{turn_count}: *WAR - #{@winner.name} won 6 cards"
        else @current_turn == :basic
          p "Turn #{turn_count}: #{@winner.name} won 2 cards"
        end

        p @player1.deck.cards.count
        p @player2.deck.cards.count
        # require 'pry'; binding.pry
        #when there's a war, issue not being able to rank the card[2]
        #turn
      end
    end
  end
