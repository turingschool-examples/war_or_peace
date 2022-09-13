require '../lib/game'
require 'spec_helper'
require 'pry'

RSpec.describe Game do
  describe '#init' do
    game = Game.new
    it 'exists' do
      expect(game).to be_an Game
    end

    it 'has attributes' do
      expect(game).to have_attributes({turn: nil, full_deck: [], deck1: nil, deck2: nil, player1: nil, player2: nil, counter: 1})
    end

    it 'has a @full_deck' do
      expect(game.full_deck).to be_truthy
    end

    it 'has @deck1 and @deck2' do
      expect(game.deck1).to eq nil
      expect(game.deck2).to eq nil
    end

    it 'has @player1 and @player2' do
      expect(game.player1).to be nil
      expect(game.player2).to be nil
    end

    it 'has a @turn' do
      expect(game.turn).to be nil
    end

    it 'has a @counter' do
      expect(game.counter).to be_truthy
      expect(game.counter).to eq(1)
    end
  end

  context '#create_full_deck' do
    it '#exists' do
      game = Game.new
      expect(game.create_full_deck).to be_truthy
    end

    it 'populates game@full_deck with 52 elements' do
      game = Game.new
      game.create_full_deck
      expect(game.full_deck.length).to eq(52)
    end

    it 'populates game@full_deck with 52 Cards' do
      game = Game.new
      game.create_full_deck
      expect(game.full_deck[0]).to be_a Card
      expect(game.full_deck[51]).to be_a Card
    end
  end

  describe '@deck1' do
    game = Game.new
    it 'is initialized as nil' do
      expect(game.deck1).to eq nil
    end
  end

  context '#split_deck' do
    it 'splits the @full_deck' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      expect(game.deck1.cards.length).to eq(26)
      expect(game.deck2.cards.length).to eq(26)
      expect(game.deck1).to_not eq(game.deck2)
      expect(game.deck1).to be_a Deck
    end
  end

  describe '#make_turn' do
    game = Game.new

    it 'assigns a Turn object to @turn' do
      game.create_full_deck
      game.shuffle_the_deck
      game.create_players
      game.make_turn
      expect(game.turn).to be_a Turn
    end
  end

  describe '@turn' do
    it 'is a Turn object' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      expect(game.turn).to be_a Turn
      expect(game.turn.player1).to be_a Player
      expect(game.turn.player1.name).to eq('Megan')
      expect(game.turn.player2.deck).to be_a Deck
    end
  end

  describe '#game_over?' do
    it 'determines if game over?' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      expect(game.turn).to be_a Turn
      expect(game.turn.player1.name).to eq('Megan')
      expect(game.game_over?).to be false
      game.turn.player1.deck.cards = []
      expect(game.game_over?).to be true
    end
  end

  describe '#two_card_endgame?' do
    game = Game.new
    game.create_full_deck
    game.shuffle_the_deck
    game.split_deck
    game.create_players
    game.make_turn
    it 'determines if either player has exactly 2 cards' do
      expect(game.two_card_endgame?).to be false
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      game.turn.player1.deck.cards = [card1, card2]
      expect(game.two_card_endgame?).to be true
    end
  end

  describe '#two_card_endgame' do
    context "turn.type is :basic" do
      it 'does not result in game_over?' do
        game = Game.new
        game.create_full_deck
        game.shuffle_the_deck
        game.split_deck
        game.create_players
        game.make_turn
        # require 'pry'; binding.pry
        allow(game.turn).to receive(:type) { :basic }
        expect(game.turn.type).to eq(:basic)
        game.two_card_endgame(1)
        expect(game.game_over?).to be false
      end
    end

    # xit 'can return :basic or :war' do
    #   game.turn.player2.deck = game.turn.player1.deck
    #   expect(game.two_card_endgame).to eq("not allowed")
    # end
    it 'pushes 2 card to the winner when :war' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      expect(game.turn.player1.deck.cards.length).to eq(26)
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      game.turn.player1.deck = Deck.new([card1, card2, card1])
      game.turn.player2.deck = Deck.new([card1, card2])
      expect(game.turn.type).to eq(:war)
      game.two_card_endgame(1)
      expect(game.turn.player1.deck.cards.length).to eq(5)
    end
  end

  describe '#one_card_endgame?' do
    xit 'determines if either player has exactly 1 card' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      expect(game.one_card_endgame?).to be false
      card1 = Card.new(:heart, 'Jack', 11)
      game.turn.player1.deck.cards = [card1]
      expect(game.one_card_endgame?).to be true
    end
  end

  describe '#normal_game_play' do
    game = Game.new
    game.create_full_deck
    game.shuffle_the_deck
    game.split_deck
    game.create_players
    game.make_turn

    it 'removes 3 card from each player when :mutually_assured_destruction' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card1, card2, card6, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck2
      expect(game.turn.player1.deck.cards.length).to eq(4)
      expect(game.turn.type).to eq(:mutually_assured_destruction)
      game.normal_game_play(game.counter)
      # binding.pry
      expect(game.turn.player1.deck.cards.length).to eq(1)
      expect(game.turn.player2.deck.cards.length).to eq(1)
    end

    it 'awards 6 total cards to the winner of WAR' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card1, card2, card2, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck2
      expect(game.turn.type).to eq(:war)
      # binding.pry
      expect(game.player1.deck.cards.length).to eq(4)
      game.normal_game_play(game.counter)
      expect(game.turn.winner.name).to eq('Megan')
      expect(game.turn.player1.deck.cards.length).to eq(7)
      expect(game.turn.player2.deck.cards.length).to eq(1)
    end

    it 'awards 2 total cards to the winner of :basic' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      deck2 = Deck.new([card2, card2, card2, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck2
      expect(game.turn.type).to eq(:basic)
      expect(game.turn.player1.deck.cards.length).to eq(4)
      expect(game.turn.winner.name).to eq('Megan')
      game.normal_game_play(game.counter)
      expect(game.turn.player1.deck.cards.length).to eq(5)
      expect(game.turn.player2.deck.cards.length).to eq(3)
    end
  end

  describe '#one_card_endgame' do
    game = Game.new
    game.create_full_deck
    game.shuffle_the_deck
    game.split_deck
    game.create_players
    game.make_turn

    it 'moves last card to winner of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card2])
      deck2 = Deck.new([card1, card2, card2, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck2
      expect(game.player1.deck.cards.length).to eq(1)
      game.one_card_endgame
      expect(game.player1.deck.cards.length).to eq(0)
      expect(game.turn.player2.deck.cards.length).to eq(5)
    end

    it 'results in game_over' do
      expect(game.game_over?).to be true
    end

    xit 'does not end in game_over? if game not over' do
      game.player1.has_lost = false
      game.player2.has_lost = false
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      deck1 = Deck.new([card1])
      deck2 = Deck.new([card2, card2, card2, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck2
      expect(game.game_over?).to be false
      game.one_card_endgame
      expect(game.turn.player1.deck.cards.length).to eq(2)
      expect(game.turn.player2.deck.cards.length).to eq(3)
      expect(game.game_over?).to be false
    end
  end

  context '#start' do
    game = Game.new
    game.start

    context "creating and shuffling the deck of cards" do
      it 'populates @full_deck with cards' do
        expect(game.full_deck).not_to eq([])
        expect(game.full_deck[0]).to be_a Card
      end

      it 'will #shuffle_the_deck' do
        game = Game.new
        just_a_full_deck_unshuffled = game.create_full_deck
        unshuffled_first_card = just_a_full_deck_unshuffled[0]
        shuffled = game.shuffle_the_deck
        shuffled_first_card = shuffled[0]
        expect(unshuffled_first_card).not_to eq(shuffled_first_card)
      end
    end



    it 'creates two Players' do
      expect(game.player1).to be_a Player
      expect(game.player2).to be_a Player
    end

    xit 'splits the shuffled deck into two' do
      expect(game.deck1.cards.length).to eq(26)
    end

    it 'creates a Turn object for @turn' do
      expect(game.turn).to be_a Turn
    end
  end

  context '#create_players' do
    game = Game.new
    game.create_players

    it 'makes player1' do
      expect(game.player1).to be_a Player
    end

    it 'makes player2' do
      expect(game.player2).to be_a Player
    end
  end

  context '#game_over' do
    xit 'puts messages to STDOUT if player1 loses' do
      game = Game.new
      game.start
      game.player1.deck.cards = []
      expect(game.player1.deck.cards.length).to eq(0)
      expect { game.game_over }.to output.to_stdout
    end

    xit 'puts messages to STDOUT if player2 loses' do
      game = Game.new
      game.start
      expect(game.deck1).to be_a Deck
      expect(game.player1.deck.cards).to be_an Array
      expect(game.player1.deck.cards.length).to eq(26)
      game.player2.deck.cards = []
      expect(game.player2.deck.cards.length).to eq(0)
      expect { game.game_over }.to output.to_stdout
    end

    it 'puts messages to STDOUT if no winner' do
      game = Game.new
      game.start
      game.counter = 10_000
      expect { game.game_over }.to output {
                                     puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
                                     puts '---- DRAW ----'
                                   }.to_stdout
    end
  end

  context '#game_loop' do
    game = Game.new
    game.start
    xit 'is true' do
      expect(game.game_loop).to be_truthy
    end
  end

  context '#player2_wins_basic?' do
    game = Game.new
    game.create_full_deck
    game.shuffle_the_deck
    game.split_deck
    game.create_players
    game.make_turn
    game.player1.deck.cards[0] = Card.new(:diamond, '2', 2)
    game.player2.deck.cards[0] = Card.new(:diamond, '3', 3)
    it 'can determine the winner' do
      expect(game.player2_wins_basic?).to eq(true)
    end
  end
end
