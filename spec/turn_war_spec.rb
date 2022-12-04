require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

#turn type : war
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
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  describe '#type' do
    it 'has a :war turn type' do
      expect(@turn.type).to eq(:war)
    end
  end

  describe '#winner' do
    it 'determines the winner of the turn for war' do
      expect(@turn.winner.name).to eq('Aurora')
      expect(@turn.type).to eq(:war)
    end
  end

  describe '#pile_cards' do
    it 'send 3 cards from the players decks into @spoils_of_war for war' do
      @winner = @turn.winner
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card4, @card2, @card3, @card5, @card6])
      expect(@turn.player1.deck.cards).to eq([@card8])
      expect(@turn.player2.deck.cards).to eq([@card7])
    end
  end
  
  describe '#award_spoils' do
    it 'adds each of the cards in @spoils_of_war to winner of the turn for war' do
      @winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(@winner)
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7,@card1, @card4, @card2, @card3, @card5, @card6])
      expect(@turn.spoils_of_war).to eq([])
    end
  end
end