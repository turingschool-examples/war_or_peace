require 'rspec'
require './lib/turn'

describe Turn do
  describe '#initialize' do
    it 'can make two players' do
      deck_1 = ['placeholder']
      deck_2 = ['placeholder']
      player1 = Player.new('Nate', deck_1)
      player2 = Player.new('Clarisa', deck_2)

      turn = Turn.new(player1, player2)

      expect(turn.player1.name).to eq('Nate')
      expect(turn.player2.name).to eq('Clarisa')
    end
    it 'has an empty spoils array' do
      deck_1 = ['placeholder array']
      deck_2 = ['placeholder array']
      player1 = Player.new('Nate', deck_1)
      player2 = Player.new('Clarisa', deck_2)

      turn = Turn.new(player1, player2)

      expect(turn.spoils_of_war).to eq([])
    end
  end
  describe '#type' do
    it 'has type method which correctly returns basic type' do
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

      expect(turn.type).to eq(:basic)
  end
  it 'has type method which correctly returns war type' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:spade, 'Jack', 11)
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

    expect(turn.type).to eq(:war)
  end
  it 'has type method which correctly returns MAD type' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:spade, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])

    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.type).to eq(:mutually_assured_destruction)
  end
end
end
