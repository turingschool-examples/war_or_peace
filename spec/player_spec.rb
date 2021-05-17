require 'rspec'
require './lib/player'
require './lib/deck'
require './lib/card'

describe Player do
  before :each do
    @cards = [
      Card.new(:spade, 'Two', 2),
      Card.new(:spade, 'Three', 3),
      Card.new(:spade, 'Four', 4),
      Card.new(:spade, 'Five', 5),
      Card.new(:spade, 'Six', 6),
      Card.new(:spade, 'Seven', 7),
      Card.new(:spade, 'Eight', 8),
      Card.new(:spade, 'Nine', 9),
      Card.new(:spade, 'Ten', 10),
      Card.new(:spade, 'Jack', 11),
      Card.new(:spade, 'Queen', 12),
      Card.new(:spade, 'King', 13),
      Card.new(:spade, 'Ace', 14),
      Card.new(:heart, 'Two', 2),
      Card.new(:heart, 'Three', 3),
      Card.new(:heart, 'Four', 4),
      Card.new(:heart, 'Five', 5),
      Card.new(:heart, 'Six', 6),
      Card.new(:heart, 'Seven', 7),
      Card.new(:heart, 'Eight', 8),
      Card.new(:heart, 'Nine', 9),
      Card.new(:heart, 'Ten', 10),
      Card.new(:heart, 'Jack', 11),
      Card.new(:heart, 'Queen', 12),
      Card.new(:heart, 'King', 13),
      Card.new(:heart, 'Ace', 14),
      Card.new(:diamond, 'Two', 2),
      Card.new(:diamond, 'Three', 3),
      Card.new(:diamond, 'Four', 4),
      Card.new(:diamond, 'Five', 5),
      Card.new(:diamond, 'Six', 6),
      Card.new(:diamond, 'Seven', 7),
      Card.new(:diamond, 'Eight', 8),
      Card.new(:diamond, 'Nine', 9),
      Card.new(:diamond, 'Ten', 10),
      Card.new(:diamond, 'Jack', 11),
      Card.new(:diamond, 'Queen', 12),
      Card.new(:diamond, 'King', 13),
      Card.new(:diamond, 'Ace', 14),
      Card.new(:club, 'Two', 2),
      Card.new(:club, 'Three', 3),
      Card.new(:club, 'Four', 4),
      Card.new(:club, 'Five', 5),
      Card.new(:club, 'Six', 6),
      Card.new(:club, 'Seven', 7),
      Card.new(:club, 'Eight', 8),
      Card.new(:club, 'Nine', 9),
      Card.new(:club, 'Ten', 10),
      Card.new(:club, 'Jack', 11),
      Card.new(:club, 'Queen', 12),
      Card.new(:club, 'King', 13),
      Card.new(:club, 'Ace', 14),
    ]
    @deck = Deck.new(@cards)

  end

  it 'can be created' do
    player = Player.new('Aedion', @deck)
    expect(player).to be_a(Player)
  end


  it 'has a name' do
    player = Player.new('Aedion', @deck)
    expect(player.name).to eq('Aedion')
  end

  it 'player has won' do
    player = Player.new('Aedion', @deck)
    removed_card = player.deck.remove_card
    player1 = player.has_lost?(removed_card)
    expect(player1).to eq(false)
  end


end
