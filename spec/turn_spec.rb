require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

#turn type :basic
describe Turn do
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
    @turn = Turn.new(@player1, @player2) 
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@turn).to be_a(Turn)
      expect(@turn.player1.name).to eq('Megan')
      expect(@turn.player2.name).to eq('Aurora')
      expect(@turn.spoils_of_war).to eq([])
    end
  end

  describe '#type' do
    it 'has a :basic turn type' do
      expect(@turn.type).to eq(:basic)
    end
  end

  describe '#winner' do
    it 'determines the winner of the turn for basic' do
      expect(@turn.winner.name).to eq('Megan')
      expect(@turn.type).to eq(:basic)
    end
  end

  describe '#pile_cards' do
    it 'send cards from the players decks into @spoils_of_war' do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
      expect(@turn.player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@turn.player2.deck.cards).to eq([@card4, @card6, @card7])
    end
  end

  describe '#award_spoils' do
    it 'adds each of the cards in @spoils_of_war to winner of the turn' do
      @winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(@winner)
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
      expect(@turn.spoils_of_war).to eq([])
    end
  end
end