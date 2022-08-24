require '../lib/game'
require 'spec_helper'


RSpec.describe Game do
  let(:card1) { Card.new(:heart, 'Jack', 11) }
  let(:card2) { Card.new(:heart, '10', 10) }
  let(:card3) { Card.new(:heart, '9', 9) }
  let(:card4) { Card.new(:diamond, 'Jack', 11) }
  let(:card5) { Card.new(:heart, '8', 8) }
  let(:card6) { Card.new(:diamond, 'Queen', 12) }
  let(:card7) { Card.new(:heart, '3', 3) }
  let(:card8) { Card.new(:diamond, '2', 2) }
  
  let(:deck1) { Deck.new([card1, card2, card5, card8]) }
  let(:deck2) { Deck.new([card3, card4, card6, card7]) }
  # war situation
  let(:deck3) { Deck.new([card1, card2]) }
  let(:deck4) { Deck.new([card4, card3, card6, card7]) }
  let(:deck5) { Deck.new([card4]) }
  let(:deck6) { Deck.new([card1, card2, card6, card1]) }
  
  let(:player1) { Player.new('Megan', deck1) }
  let(:player2) { Player.new('Aurora', deck2) }
  let(:player3) { Player.new('April', deck3) }
  let(:player4) { Player.new('Maddie', deck4) }
  let(:player5) { Player.new('Aurora', deck6) }
  
  let(:turn) { Turn.new(player1, player2) }
  let(:game) { Game.new(turn) }
  
  it 'exists' do
    expect(game).to be_an Game
  end
  
  it 'has attributes' do
    expect(game.turn_type).to eq(:basic)
    expect(game.hand_winner).to eq(player1)
  end
  
  describe '#endgame?' do
    it 'determines if a player has less than 3 cards' do
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
    it 'determines if either player has exactly 3 cards' do
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
  describe '#one_card_endgame?' do
    it 'determines if either player has exactly 1 card' do
      expect(game.one_card_endgame?).to be false
      game.turn.player1.deck.cards = [card1]
      expect(game.one_card_endgame?).to be true
    end
  end
end