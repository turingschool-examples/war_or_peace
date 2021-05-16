require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'

RSpec.describe Game do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  it 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it 'has a diamond array' do
    game = Game.new

    expect(game.diamonds).to eq([])
  end

  it 'has a heart array' do
    game = Game.new

    expect(game.hearts).to eq([])
  end

  it 'has a spade array' do
    game = Game.new

    expect(game.spades).to eq([])
  end

  it 'has a club array' do
    game = Game.new

    expect(game.clubs).to eq([])
  end

  describe 'Commands' do
    it 'can add diamond cards' do
      game = Game.new

      game.add_diamond_card

      expect(game.diamonds.first).to eq([:diamond, '2', 2])
      expect(game.diamonds.last).to eq([:diamond, 'Ace', 14])
    end

    xit 'can add club cards' do
      game = Game.new

      game.add_club_card

      expect(game.clubs.first).to eq([:club, '2', 2])
      expect(game.clubs.last).to eq([:club, 'Ace', 14])
    end

    it 'can add spade cards' do
      game = Game.new

      game.add_spade_card

      expect(game.spades.first).to eq([:spade, '2', 2])
      expect(game.spades.last).to eq([:spade, 'Ace', 14])
    end

    xit 'can add heart cards' do
      game = Game.new

      game.add_heart_card

      expect(game.hearts.first).to eq([:heart, '2', 2])
      expect(game.hearts.last).to eq([:heart, 'Ace', 14])
    end

    xit 'can create a deck' do
        game = Game.new

        game.add_diamond_card
        game.add_club_card
        game.add_spade_card
        game.add_heart_card

        deck1 = Deck.new(game.create_deck)

        expect(deck1.cards.first.suit).to eq(:diamond)
        expect(deck1.cards.first.rank).to eq(2)
        expect(deck1.cards.last.suit).to eq(:heart)
        expect(deck1.cards.last.rank).to eq(14)
    end

  end

end
