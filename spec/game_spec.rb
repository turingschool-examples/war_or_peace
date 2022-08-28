require '../lib/game'
require 'spec_helper'
require 'pry'

RSpec.describe Game do
  # let(:card3) { Card.new(:heart, '9', 9) }
  # let(:card4) { Card.new(:diamond, 'Jack', 11) }
  # let(:card5) { Card.new(:heart, '8', 8) }
  # let(:card7) { Card.new(:heart, '3', 3) }
  # let(:card8) { Card.new(:diamond, '2', 2) }

  # # :basic decks
  # let(:deck1) { Deck.new([card1, card2, card5, card8]) }
  # let(:deck2) { Deck.new([card3, card4, card6, card7]) }
  # # :war decks
  # let(:war_deck1) { Deck.new([card1, card2, card5, card8]) }
  # let(:war_deck2) { Deck.new([card4, card3, card6, card7]) }

  # # :war endgame
  # let(:war_deck3) { Deck.new([card1, card2]) }
  # let(:war_deck4) { Deck.new([card4, card3, card6, card7]) }

  # let(:player1) { Player.new('Megan', deck1) }
  # let(:player2) { Player.new('Aurora', deck2) }
  # let(:player3) { Player.new('April', deck3) }

  # # :war players
  # let(:war_player1) { Player.new('Megan', war_deck1) }
  # let(:war_player2) { Player.new('Aurora', war_deck2) }

  # # :m_a_d players
  # let(:player4) { Player.new('Maddie', deck5) }
  # let(:player5) { Player.new('Aurora', deck6) }

  # # let(:turn) { Turn.new(player1, player2) }
  # # let(:game) { Game.new(turn) }

  # let(:war_turn) { Turn.new(war_player1, war_player2) }
  # let(:war_game) { Game.new(war_turn) }

  # # :m_a_d turn and game
  # let(:mad_turn) { Turn.new(player4, player5) }
  # let(:mad_game) { Game.new(mad_turn) }

  # # one_card_endgame deck
  # let(:one_card_endgame_deck1) { Deck.new([card2]) }
  # let(:one_card_endgame_deck2) { Deck.new([card1, card3, card4, card5]) }

  # # one_card_endgame players
  # let(:one_card_endgame_player4) { Player.new('Maddie', one_card_endgame_deck1) }
  # let(:one_card_endgame_player5) { Player.new('Aurora', one_card_endgame_deck2) }

  # # one_card_endgame turn and game
  # let(:one_card_endgame_turn) { Turn.new(one_card_endgame_player4, one_card_endgame_player5) }
  # let(:one_card_endgame_game) { Game.new(one_card_endgame_turn) }

  # let(:counter) { 1 }

  describe '#init' do
    game = Game.new
    it 'exists' do
      expect(game).to be_an Game
    end

    xit 'has attributes' do
      expect(game.turn_type).to eq(:basic)
      expect(game.hand_winner).to eq(player1)
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

  # describe '#three_card_endgame?' do
  #   it 'determines if either player has exactly 3 cards' do
  #     expect(game.three_card_endgame?).to be false
  #     game.turn.player1.deck.cards = [card1, card2, card3]
  #     expect(game.three_card_endgame?).to be true
  #   end
  # end

  describe '#two_card_endgame?' do
    it 'determines if either player has exactly 2 cards' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      expect(game.two_card_endgame?).to be false
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      game.turn.player1.deck.cards = [card1, card2]
      expect(game.two_card_endgame?).to be true
    end
  end

  describe '#two_card_endgame' do
    # xit 'can return :basic or :war' do
    #   expect(game.two_card_endgame).to eq(:basic)
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
    it 'determines if either player has exactly 1 card' do
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
    it 'removes 3 card from each player when :mutually_assured_destruction' do
      game = Game.new
      game.create_full_deck
      game.shuffle_the_deck
      game.split_deck
      game.create_players
      game.make_turn
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card6, card1])
      game.turn.player1.deck = deck1
      game.turn.player2.deck = deck1
      game.normal_game_play(game.counter)
      expect(game.turn.type).to eq(:mutually_assured_destruction)
      expect(game.turn.player1.deck.cards.length).to eq(1)
      expect(game.turn.player2.deck.cards.length).to eq(1)
    end

    xit 'awards 6 total cards to the winner of WAR' do
      war_game.normal_game_play(counter)
      # binding.pry
      expect(war_game.turn.player1.deck.cards.length).to eq(1)
      expect(war_game.turn.player2.deck.cards.length).to eq(7)
    end

    xit 'awards 2 total cards to the winner of :basic' do
      game.normal_game_play(counter)
      # binding.pry
      expect(game.turn.player1.deck.cards.length).to eq(5)
      expect(game.turn.player2.deck.cards.length).to eq(3)
    end
  end

  describe '#one_card_endgame' do
    xit 'moves last card to winner of turn' do
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(5)
    end

    xit 'results in game_over' do
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(5)
      expect(one_card_endgame_game.game_over?).to be true
    end

    xit 'does not end in game_over? if game not over' do
      one_card_endgame_game.turn.player1.deck.cards[0] = card6
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player1.deck.cards.length).to eq(2)
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(3)
      expect(one_card_endgame_game.game_over?).to be false
    end
  end

  context '#start' do
    xit 'populates @full_deck with cards' do
      game.start
      expect(game.full_deck).not_to eq([])
      expect(game.full_deck[0]).to be_a Card
    end

    xit 'will #shuffle_the_deck' do
      game.start
      before = game.full_deck
      expect(before).to eq(game.full_deck)
      after = game.shuffle_the_deck
      expect(before).not_to eq(after)
    end

    xit 'creates two Players' do
      game.start
      expect(game.player1).to be_a Player
      expect(game.player2).to be_a Player
    end 
  end

  context '#create_players' do
    xit 'makes player1' do
      game.create_players
      expect(game.player1).to be_a Player
    end

    xit 'makes player2' do
      game.create_players
      expect(game.player2).to be_a Player
    end
  end

  context '#game_over' do
    xit 'exists' do
      expect(game.game_over).to be_truthy
    end

    xit 'puts messages to STDOUT' do
      expect { game.game_over }.to output.to_stdout
    end
  end
end
