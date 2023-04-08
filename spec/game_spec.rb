require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @deck_of_cards = DeckGenerator.new.generate_deck.cards.shuffle!
    @game = Game.new(deck_of_cards: @deck_of_cards)
  end

  describe '#init' do
    it 'exists' do
      expect(@game).to be_an Game
    end

    it 'has @turn set to nil' do
      expect(@game.turn).to eq(nil)
    end

    it 'has @deck1 and @deck2' do
      expect(@game.deck1).to be_a Deck
      expect(@game.deck2).to be_a Deck
    end

    it 'has @player1 and @player2' do
      expect(@game.player1).to be_a Player
      expect(@game.player2).to be_a Player
    end

    it 'has a @counter' do
      expect(@game.counter).to be_truthy
      expect(@game.counter).to eq(1)
    end
  end

  describe '#make_turn' do
    it 'assigns a Turn object to @turn' do
      @game.make_turn
      expect(@game.turn).to be_a Turn
    end
  end

  describe '@turn' do
    it 'is a Turn object' do
      @game.make_turn
      expect(@game.turn).to be_a Turn
      expect(@game.turn.player1).to be_a Player
      expect(@game.turn.player1.name).to eq('Megan')
      expect(@game.turn.player2.deck).to be_a Deck
    end
  end

  describe '#game_over?' do
    it 'determines if game over?' do
      @game.make_turn
      expect(@game.turn).to be_a Turn
      expect(@game.turn.player1.name).to eq('Megan')
      expect(@game.game_over?).to be false
      @game.turn.player1.deck.cards = []
      expect(@game.game_over?).to be true
    end
  end

  describe '#two_card_endgame?' do
    it 'determines if either player has exactly 2 cards' do
      @game.make_turn
      expect(@game.two_card_endgame?).to be false
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      @game.turn.player1.deck.cards = [card1, card2]
      expect(@game.two_card_endgame?).to be true
    end
  end

  describe '#two_card_endgame' do
    context 'turn.type is :basic' do
      it 'does not result in game_over?' do
        @game.make_turn
        allow(@game.turn).to receive(:type) { :basic }
        expect(@game.turn.type).to eq(:basic)
        @game.two_card_endgame(1)
        expect(@game.game_over?).to be false
      end
    end

    it 'pushes 2 card to the winner when :war' do
      @game.make_turn
      expect(@game.turn.player1.deck.cards.length).to eq(26)
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      @game.turn.player1.deck = Deck.new([card1, card2, card1])
      @game.turn.player2.deck = Deck.new([card1, card2])
      expect(@game.turn.type).to eq(:war)
      @game.two_card_endgame(1)
      expect(@game.turn.player1.deck.cards.length).to eq(5)
    end
  end

  describe '#one_card_endgame?' do
    it 'determines if either player has exactly 1 card' do
      @game.make_turn
      expect(@game.one_card_endgame?).to be false
      card1 = Card.new(:heart, 'Jack', 11)
      @game.turn.player1.deck.cards = [card1]
      expect(@game.one_card_endgame?).to be true
    end
  end

  describe '#normal_game_play' do
    it 'removes 3 card from each player when :mutually_assured_destruction' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card1, card2, card6, card1])
      @game.make_turn
      @game.turn.player1.deck = deck1
      @game.turn.player2.deck = deck2
      expect(@game.turn.player1.deck.cards.length).to eq(4)
      expect(@game.turn.type).to eq(:mutually_assured_destruction)
      @game.normal_game_play(@game.counter)
      expect(@game.turn.player1.deck.cards.length).to eq(1)
      expect(@game.turn.player2.deck.cards.length).to eq(1)
    end

    it 'awards 6 total cards to the winner of WAR' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card1, card2, card2, card1])
      @game.make_turn
      @game.turn.player1.deck = deck1
      @game.turn.player2.deck = deck2
      expect(@game.turn.type).to eq(:war)
      # binding.pry
      expect(@game.player1.deck.cards.length).to eq(4)
      @game.normal_game_play(@game.counter)
      expect(@game.turn.winner.name).to eq('Megan')
      expect(@game.turn.player1.deck.cards.length).to eq(7)
      expect(@game.turn.player2.deck.cards.length).to eq(1)
    end

    it 'awards 2 total cards to the winner of :basic' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card2, card2, card2, card1])
      @game.make_turn
      @game.turn.player1.deck = deck1
      @game.turn.player2.deck = deck2
      expect(@game.turn.type).to eq(:basic)
      expect(@game.turn.player1.deck.cards.length).to eq(4)
      expect(@game.turn.winner.name).to eq('Megan')
      @game.normal_game_play(@game.counter)
      expect(@game.turn.player1.deck.cards.length).to eq(5)
      expect(@game.turn.player2.deck.cards.length).to eq(3)
    end
  end

  describe '#one_card_endgame' do
    it 'moves last card to winner of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card2])
      deck2 = Deck.new([card1, card2, card2, card1])
      @game.make_turn
      @game.turn.player1.deck = deck1
      @game.turn.player2.deck = deck2
      expect(@game.player1.deck.cards.length).to eq(1)
      @game.one_card_endgame
      expect(@game.player1.deck.cards.length).to eq(0)
      expect(@game.turn.player2.deck.cards.length).to eq(5)
    end

    xit 'results in game_over' do
      expect(@game.game_over?).to be true
    end

    it 'does not end in game_over? if game not over' do
      @game.player1.has_lost = false
      @game.player2.has_lost = false
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      deck1 = Deck.new([card1])
      deck2 = Deck.new([card2, card2, card2, card1])
      @game.make_turn
      @game.turn.player1.deck = deck1
      @game.turn.player2.deck = deck2
      expect(@game.game_over?).to be false
      @game.one_card_endgame
      expect(@game.turn.player1.deck.cards.length).to eq(2)
      expect(@game.turn.player2.deck.cards.length).to eq(3)
      expect(@game.game_over?).to be false
    end
  end

  context '#start' do


    it 'creates a Turn object for @turn' do
      @game.make_turn
      expect(@game.turn).to be_a Turn
    end
  end


  context '#game_over' do
    it 'puts messages to STDOUT if player1 loses' do
      @game.start
      @game.player1.deck.cards = []
      expect(@game.player1.deck.cards.length).to eq(0)
      expect { @game.game_over }.to output.to_stdout
    end

    it 'puts messages to STDOUT if player2 loses' do
      @game.start
      expect(@game.deck1).to be_a Deck
      expect(@game.player1.deck.cards).to be_an Array
      @game.player2.deck.cards = []
      expect(@game.player2.deck.cards.length).to eq(0)
      expect { @game.game_over }.to output.to_stdout
    end

    it 'puts messages to STDOUT if no winner' do
      @game.start
      @game.counter = 10_000
      expect { @game.game_over }.to output {
                                      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
                                      puts '---- DRAW ----'
                                    }.to_stdout
    end
  end

  context '#player2_wins_basic?' do
    it 'can determine the winner' do
      @game.make_turn
      @game.player1.deck.cards[0] = Card.new(:diamond, '2', 2)
      @game.player2.deck.cards[0] = Card.new(:diamond, '3', 3)
      expect(@game.player2_wins_basic?).to eq(true)
    end
  end
end
