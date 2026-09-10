require 'rspec'
require 'pry'
require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Turn do 

  describe ":basic type" do 

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
  
      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)
  
      @turn = Turn.new(@player1, @player2) 
    end
    
    it "exists" do 
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has players" do 
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end

    it "initializes with an empty array in #war_spoils" documentation
    expect(@turn.war_spoils).to eq([])
  end

    it 'has a basic turn type' do 
    expect(@turn.type).to eq(:basic)
  end

    it "can have a winner" do 
      expect(@turn.winner).to eq(@player1)
    end

    it "moves cards won into #war_spoils" do
    @turn.pile_cards
    expect(@turn.war_spoils).to eq([@card1, @card3])
    end

    it "awards cards won in :basic type to winner" do
      winner = @turn.winner
      
      @turn.pile_cards
      @turn.award_spoils(winner)

      expect(@player1.deck.cards).to eq([@cards2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end
end


Describe ":war type" do 
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

  it 'has a turn type' do 
    expect(@turn.type).to eq(:war)
  end

  it 'can have a winner of' do 
    expect(@turn.winner).to eq(@player2)
  end

  it 'awards cards won into #war_spoils' do
    @turn.pile_cards
    expect(@turn.war_spoils).to eq([@card1, @card4, @card2, @card3, @card5, @card6])
  end

  it 'awards cards won in :war type to winner' do 
    @winner = @turn.winner

    @turn.pile_cards
    @turn.award_spoils(@winner)

    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7, @card1, @card4, @card2, @card3, @card5, @card6])
  end

  describe ":mutually_assured_destruction type" do

      before(:each) do
        @card1 = Card.new(:heart, 'Jack', 11)
        @card2 = Card.new(:heart, '10', 10)    
        @card3 = Card.new(:heart, '9', 9)    
        @card4 = Card.new(:diamond, 'Jack', 11)    
        @card5 = Card.new(:heart, '8', 8)    
        @card6 = Card.new(:diamond, '8', 8)    
        @card7 = Card.new(:heart, '3', 3)    
        @card8 = Card.new(:diamond, '2', 2)    

        @deck1 = Deck.new([@card1, @card2, @card5, @card8])
        @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    
        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)
    
        @turn = Turn.new(@player1, @player2)
      end

    it "has a turn type" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end
    
    it "does not have a winner of " do
      expect(@turn.winner).to eq("No Winner")
    end
    
    it "removes 3 cards of each player's deck from play" do
      @winner = @turn.winner
      @turn.pile_cards
      
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end
  end
end