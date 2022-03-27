require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)

    @turn = Turn.new(@player1, @player2)
  end

  it 'exists' do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it 'has players' do
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
  end

  it 'has a turn type' do

    expect(@turn.type).to eq(:basic)
  end

  it 'has spoils of war' do

    expect(@turn.spoils_of_war).to eq([])
  end

  describe '#winner' do
    it 'return winning player for basic' do
      @turn.type

      expect(@turn.winner).to eq(@player1)
    end
    it 'return winning player for war' do
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type

      expect(turn.winner).to eq(player2)
    end
    it 'return no winner for mutually assured destruction' do
      @card6 = Card.new(:diamond, '8', 8)
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type

      expect(turn.winner).to eq("No Winner")
    end

  end

  describe '#pile_cards' do
    it 'put both index 0 cards into spoils_of_war for basic' do
      @turn.type
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([@card1, @card3])
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end
    it 'put both sets of index 0-2 cards into spoils for war' do
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type
      turn.pile_cards

      expect(turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
      expect(@player1.deck.cards).to eq([@card8])
      expect(player2.deck.cards).to eq([@card7])
    end
    it 'removes involved cards from play after MAD' do
      @card6 = Card.new(:diamond, '8', 8)
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type
      turn.winner

      expect(turn.pile_cards).to eq([])
      expect(@player1.deck.cards).to eq([@card8])
      expect(player2.deck.cards).to eq([@card7])
    end
  end
  describe '#award_spoils' do
    it 'add spoils to winner deck in basic' do
      @turn.type
      @turn.pile_cards
      @turn.award_spoils(@player1)

      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end
    it 'add spoils to winner deck in war' do
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type
      turn.pile_cards
      turn.award_spoils(player2)

      expect(@player1.deck.cards).to eq([@card8])
      expect(player2.deck.cards).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
    end
    it 'returns string about spoils if MAD' do
      @card6 = Card.new(:diamond, '8', 8)
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(@player1, player2)

      turn.type
      turn.winner
      turn.pile_cards

      expect(turn.award_spoils(turn.winner)).to eq([])
      expect(turn.award_spoils(turn.winner)).to eq([])
      expect(@player1.deck.cards).to eq([@card8])
      expect(player2.deck.cards).to eq([@card7])
    end
  end
end
