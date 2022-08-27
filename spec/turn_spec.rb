require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe do 
  describe 'context' do 
#context'basic_type' do 
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
    
    it 'exists' do 
      expect(@turn).to be_instance_of(Turn)
    end
    
    it 'has a turn type' do
      expect(@turn.type).to eq(:basic)
    end
    
    it 'has a winner' do
      expect(@turn.winner).to eq(@player1)
    end
    
    it 'starts with empty array for spoils_of_war' do
      expect(@turn.spoils_of_war).to eq([])
    end
    
    it 'pile_cards basic' do 
      @turn.pile_cards
      
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end
  end
  describe 'war' do 
    it 'pile_cards war' do 
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
      @turn.pile_cards
      
      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end
  end 

  describe 'piles cards' do 
    it 'pile_cards mutually assured destruction' do 
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
      
      expect(@turn.spoils_of_war).to eq([])
    end
  end

  it "will award spoils_of_war to basic winner" do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)  
    @player2 = Player.new("Aurora", @deck2) 
    @turn = Turn.new(@player1, @player2)  

    @turn.player1
    @turn.player2

    winner = @turn.winner

    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
    expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
  end

  describe 'war' do 
    it 'awards spoils of war to war winner' do 
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)  
    @player2 = Player.new("Aurora", @deck2) 
    @turn = Turn.new(@player1, @player2)  

    @turn.player1
    @turn.player2

    winner = @turn.winner

    @turn.pile_cards
    @turn.award_spoils(winner)
    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
    end
  end

  describe 'mutually assured destruction' do 
    it 'removes cards from players deck' do 
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

    @turn.player1
    @turn.player2

    winner = @turn.winner

    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@player1.deck.cards).to eq([@card8])
    expect(@player2.deck.cards).to eq([@card7])
    end
  end
end