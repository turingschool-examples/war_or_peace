require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  it "exists and has attributes" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn = Turn.new(player1, player2) 

    expect(turn).to be_an_instance_of(Turn)
    expect(turn.player1.name).to eq('V')
    expect(turn.player2.name).to eq('Michelle')
    expect(turn.spoils_of_war).to eq([])
  end
  describe 'basic turn' do
    before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @card4 = Card.new(:diamond, 'Jack', 11) 
    @basic_deck1 = Deck.new([@card1, @card2])
    @basic_deck2 = Deck.new([@card3, @card4])
    @player1 = Player.new('V', @basic_deck1)
    @player2 = Player.new('Michelle', @basic_deck2)
    @basic_turn = Turn.new(@player1, @player2) 
    end 
    it 'is type basic' do
      expect(@basic_turn.type).to eq(:basic)
    end
    it 'has a winner' do
      expect(@basic_turn.winner.name).to eq('Michelle')
    end
    it 'piles cards and award points' do # pile cards calls award points. Unable to test award points at this time
      @basic_turn.pile_cards
      expect(@basic_turn.spoils_of_war).to eq([@card1, @card3])
      expect(@player1.deck.cards).to eq([@card2])
    end
  end 
  describe 'war turn' do
    before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @card4 = Card.new(:diamond, 'Jack', 12) 
    @card5 = Card.new(:spade, 'Ace', 14)  
    @card6 = Card.new(:spade, 'Jack', 11) 
    @war_deck1 = Deck.new([@card1, @card2, @card3])
    @war_deck2 = Deck.new([@card4, @card5, @card6])
    @player1 = Player.new('V', @war_deck1)
    @player2 = Player.new('Michelle', @war_deck2)
    @war_turn = Turn.new(@player1, @player2) 
    end 
    it 'is type war' do
      expect(@war_turn.type).to eq(:war)
    end
    it 'has a winner' do
      expect(@war_turn.winner.name).to eq('V')
    end
    it 'piles cards' do
      @war_turn.pile_cards
      expect(@war_turn.spoils_of_war).to eq([@card1, @card2, @card3, @card4, @card5, @card6])
    end 
    # it 'awards points' do
    #   binding.pry
    #   @war_turn.award_spoils(@war_turn.winner)
    #   expect(@war_turn.winner.deck.cards).to eq([@card2, @card1, @card3, @card4, @card6])
    # end 
  end 
  describe 'mutual_destruction turn' do
    before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)  
    @card4 = Card.new(:diamond, 'Jack', 12) 
    @card5 = Card.new(:spade, 'Ace', 11)  
    @card6 = Card.new(:spade, 'Jack', 14) 
    @mutual_destruction_deck1 = Deck.new([@card1, @card2, @card3])
    @mutual_destruction_deck2 = Deck.new([@card4, @card5, @card6])
    @player1 = Player.new('V', @mutual_destruction_deck1)
    @player2 = Player.new('Michelle', @mutual_destruction_deck2)
    @mutual_destruction_turn = Turn.new(@player1, @player2) 
    end 
    it 'is type mutual_destruction' do
      expect(@mutual_destruction_turn.type).to eq(:mutually_assured_destruction)
    end
    it 'has no winner' do
      expect(@mutual_destruction_turn.winner).to eq('No Winner')
    end
    it 'piles cards and award points' do
      @mutual_destruction_turn.pile_cards
      expect(@mutual_destruction_turn.spoils_of_war).to eq([])
      expect(@player1.deck.cards).to eq([])
      expect(@player2.deck.cards).to eq([])
    end 
  end 
end 