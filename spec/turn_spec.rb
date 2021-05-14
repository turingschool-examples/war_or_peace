require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  card1 = Card.new(:heart, 'Jack', 11)
  card2 = Card.new(:heart, '10', 10)
  card3 = Card.new(:heart, '9', 9)
  card4 = Card.new(:diamond, 'Jack', 11)
  card5 = Card.new(:heart, '8', 8)
  card6 = Card.new(:diamond, 'Queen', 12)
  card7 = Card.new(:heart, '3', 3)
  card8 = Card.new(:diamond, '2', 2)
  deck1 = Deck.new([card1, card2, card5, card8])
  deck2 = Deck.new([card3, card4, card6, card7])
  player1 = Player.new("Megan", deck1)
  player2 = Player.new("Aurora", deck2)
  turn = Turn.new(player1, player2)

  context 'Attribues' do
    it 'is a turn' do
      expect(turn).to be_an_instance_of(Turn)
    end

    it 'returns arguments as attributes' do
      expect(turn.player_1).to eq(player1)
      expect(turn.player_2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  context 'Methods' do
    it 'returns type of turn :basic' do
      expect(turn.type).to eq(:basic)
    end
    it 'returns type of turn :war' do
      new_deck1 = Deck.new([card1, card2, card5, card8])
      new_deck2 = Deck.new([card1, card4, card6, card7])
      new_player1 = Player.new("Megan", new_deck1)
      new_player2 = Player.new("Aurora", new_deck2)
      new_turn = Turn.new(new_player1, new_player2)
      expect(new_turn.type).to eq(:war)
    end
    it 'returns type of turn :mutually_assured_destruction' do
      new_deck1 = Deck.new([card1, card2, card5, card8])
      new_deck2 = Deck.new([card1, card4, card5, card7])
      new_player1 = Player.new("Megan", new_deck1)
      new_player2 = Player.new("Aurora", new_deck2)
      new_turn = Turn.new(new_player1, new_player2)
      expect(new_turn.type).to eq(:mutually_assured_destruction)
    end
  end
end
