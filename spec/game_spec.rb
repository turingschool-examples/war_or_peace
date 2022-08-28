require '../lib/game'
require 'spec_helper'
require 'pry'

RSpec.describe Game do
  let(:card1) { Card.new(:heart, 'Jack', 11) }
  let(:card2) { Card.new(:heart, '10', 10) }
  let(:card3) { Card.new(:heart, '9', 9) }
  let(:card4) { Card.new(:diamond, 'Jack', 11) }
  let(:card5) { Card.new(:heart, '8', 8) }
  let(:card6) { Card.new(:diamond, 'Queen', 12) }
  let(:card7) { Card.new(:heart, '3', 3) }
  let(:card8) { Card.new(:diamond, '2', 2) }

  # :basic decks
  let(:deck1) { Deck.new([card1, card2, card5, card8]) }
  let(:deck2) { Deck.new([card3, card4, card6, card7]) }
  # :war decks
  let(:war_deck1) { Deck.new([card1, card2, card5, card8]) }
  let(:war_deck2) { Deck.new([card4, card3, card6, card7]) }

  # :war endgame
  let(:war_deck3) { Deck.new([card1, card2]) }
  let(:war_deck4) { Deck.new([card4, card3, card6, card7]) }

  # :m_a_d decks
  let(:deck5) { Deck.new([card1, card2, card6, card1]) }
  let(:deck6) { Deck.new([card1, card2, card6, card1]) }

  let(:player1) { Player.new('Megan', deck1) }
  let(:player2) { Player.new('Aurora', deck2) }
  let(:player3) { Player.new('April', deck3) }

  # :war players
  let(:war_player1) { Player.new('Megan', war_deck1) }
  let(:war_player2) { Player.new('Aurora', war_deck2) }

  # :m_a_d players
  let(:player4) { Player.new('Maddie', deck5) }
  let(:player5) { Player.new('Aurora', deck6) }

  let(:turn) { Turn.new(player1, player2) }
  let(:game) { Game.new(turn) }

  let(:war_turn) { Turn.new(war_player1, war_player2) }
  let(:war_game) { Game.new(war_turn) }

  # :m_a_d turn and game
  let(:mad_turn) { Turn.new(player4, player5) }
  let(:mad_game) { Game.new(mad_turn) }

  # one_card_endgame deck
  let(:one_card_endgame_deck1) { Deck.new([card2]) }
  let(:one_card_endgame_deck2) { Deck.new([card1, card3, card4, card5]) }

  # one_card_endgame players
  let(:one_card_endgame_player4) { Player.new('Maddie', one_card_endgame_deck1) }
  let(:one_card_endgame_player5) { Player.new('Aurora', one_card_endgame_deck2) }

  # one_card_endgame turn and game
  let(:one_card_endgame_turn) { Turn.new(one_card_endgame_player4, one_card_endgame_player5) }
  let(:one_card_endgame_game) { Game.new(one_card_endgame_turn) }

  let(:counter) { 1 }

  describe '#init' do
    it 'exists' do
      expect(game).to be_an Game
    end

    it 'has attributes' do
      expect(game.turn_type).to eq(:basic)
      expect(game.hand_winner).to eq(player1)
    end

    it 'has a @full_deck instance variable' do
      expect(game.full_deck).to be_truthy
    end

    it 'has @deck1 and @deck2 instance variables' do
      expect(game.deck1).to eq([])
      expect(game.deck2).to eq([])
    end

    it 'has 2 players' do
      expect(game.player1).to be nil
      expect(game.player2).to be nil
    end
    
    it 'has a Turn object in @turn' do
      expect(game.turn).to be_a Turn
    end
  end

  context '#create_full_deck' do
    it '#exists' do
      expect(game.create_full_deck).to be_truthy
    end

    it 'populates game@full_deck with 52 elements' do
      values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
      expected = values.zip(ranks)
      game.create_full_deck
      expect(game.full_deck.length).to eq(52)
    end

    it 'populates game@full_deck with 52 Cards' do
      game.create_full_deck
      expect(game.full_deck[0]).to be_a Card
      expect(game.full_deck[51]).to be_a Card
    end
  end

  describe '#endgame?' do
    xit 'determines if a player has less than 3 cards' do
      expect(game.endgame?).to be false
      turn.player1.deck.cards = [card1]
      expect(game.endgame?).to be true
    end
  end

  describe '#game_over?' do
    it 'determines if game over?' do
      expect(game.game_over?).to be false
      game.turn.player1.deck.cards = []
      expect(game.game_over?).to be true
    end
  end

  describe '#three_card_endgame?' do
    xit 'determines if either player has exactly 3 cards' do
      expect(game.three_card_endgame?).to be false
      game.turn.player1.deck.cards = [card1, card2, card3]
      expect(game.three_card_endgame?).to be true
    end
  end

  describe '#two_card_endgame?' do
    it 'determines if either player has exactly 2 cards' do
      expect(game.two_card_endgame?).to be false
      game.turn.player1.deck.cards = [card1, card2]
      expect(game.two_card_endgame?).to be true
    end
  end

  describe '#two_card_endgame' do
    # it 'can return :basic or :war' do
    #   expect(game.two_card_endgame).to eq(:basic)
    #   game.turn.player2.deck = game.turn.player1.deck
    #   expect(game.two_card_endgame).to eq("not allowed")
    # end

    it 'pushes 2 card to the winner when :war' do
      game.turn.player2.deck = Deck.new([card1, card2])
      # binding.pry
      game.two_card_endgame(1)
      # binding.pry
      expect(game.turn.player1.deck.cards.length).to eq(6)
      # binding.pry
    end
  end

  describe '#one_card_endgame?' do
    it 'determines if either player has exactly 1 card' do
      expect(game.one_card_endgame?).to be false
      game.turn.player1.deck.cards = [card1]
      expect(game.one_card_endgame?).to be true
    end
  end

  describe '#normal_game_play' do
    it 'removes 3 card from each player when :mutually_assured_destruction' do
      mad_game.normal_game_play(counter)
      expect(mad_game.turn.player1.deck.cards.length).to eq(1)
      expect(mad_game.turn.player2.deck.cards.length).to eq(1)
    end

    it 'awards 6 total cards to the winner of WAR' do
      war_game.normal_game_play(counter)
      # binding.pry
      expect(war_game.turn.player1.deck.cards.length).to eq(1)
      expect(war_game.turn.player2.deck.cards.length).to eq(7)
    end

    it 'awards 2 total cards to the winner of :basic' do
      game.normal_game_play(counter)
      # binding.pry
      expect(game.turn.player1.deck.cards.length).to eq(5)
      expect(game.turn.player2.deck.cards.length).to eq(3)
    end
  end

  describe '#one_card_endgame' do
    it 'moves last card to winner of turn' do
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(5)
    end

    it 'results in game_over' do
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(5)
      expect(one_card_endgame_game.game_over?).to be true
    end

    it 'does not end in game_over? if game not over' do
      one_card_endgame_game.turn.player1.deck.cards[0] = card6
      one_card_endgame_game.one_card_endgame
      expect(one_card_endgame_game.turn.player1.deck.cards.length).to eq(2)
      expect(one_card_endgame_game.turn.player2.deck.cards.length).to eq(3)
      expect(one_card_endgame_game.game_over?).to be false
    end
  end

  context '#start' do
    it 'populates @full_deck with cards' do
      game.start
      expect(game.full_deck).not_to eq([])
      expect(game.full_deck[0]).to be_a Card
    end

    it 'will #shuffle_the_deck' do
      game.start
      before = game.full_deck
      expect(before).to eq(game.full_deck)
      after = game.shuffle_the_deck
      expect(before).not_to eq(after)
    end

    it 'creates two Players' do
      game.start
      expect(game.player1).to be_a Player
      expect(game.player2).to be_a Player
    end
  end

  context '#split_deck' do
    it 'splits the @full_deck' do
      game.start
      game.shuffle_the_deck
      game.split_deck
      expect(game.deck1.cards.length).to eq(26)
      expect(game.deck2.cards.length).to eq(26)
      expect(deck1).to_not eq(deck2)
    end
  end

  context '#create_players' do
    it 'makes player1' do
      game.create_players
      expect(game.player1).to be_a Player
    end

    it 'makes player2' do
      game.create_players
      expect(game.player2).to be_a Player
    end
  end
end
