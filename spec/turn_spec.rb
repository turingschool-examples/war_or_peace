require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './spec/deck_spec'
require './spec/card_spec'
require './spec/player_spec'
require 'pry'

RSpec.describe Turn do
  describe '#initialize' do
    it 'describes player setup' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      expect(deck1.cards).to eq(cards_1)
      expect(deck2.cards).to eq(cards_2)
      expect(player1).to be_a(Player)
      expect(player2).to be_a(Player)
      expect(player1.name).to eq("Megan")
      expect(player2.name).to eq("Aurora")
      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)
    end
  end

  describe "#turn_type" do
    it 'denotes type of turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards_1 = [card1, card2, card5, card8]
    cards_2 = [card3, card4, card6, card7]
    deck1 = Deck.new(cards_1)
    deck2 = Deck.new(cards_2)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    expect(turn).to be_a(Turn)
    expect(turn.type).to eq(:basic)
    end
  end

  describe '#player1' do
    it 'identifies player 1' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.player1).to eq(player1)
    end
  end

  describe '#player2' do
    it 'identifies player 2' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.player2).to eq(player2)
    end
  end

  describe '#spoils_of_war' do
    it 'identifes spoils of war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  describe "#winner" do
    it 'identifies winner' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    cards_1 = [card1, card2, card5, card8]
    cards_2 = [card3, card4, card6, card7]
    deck1 = Deck.new(cards_1)
    deck2 = Deck.new(cards_2)
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    expect(turn.winner).to eq(player1)
    end
  end

  describe '#pile_cards' do
    it 'moves cards to spoils' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen',12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.pile_cards).to eq([card1, card3])
    end
  end

  describe '#award_spoils' do
    it 'awards spoils' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen',12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.award_spoils(player1)).to eq(cards_1)
    end
  end
end
