require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/start'
require 'pry'

RSpec.describe Start do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  
    card4 = Card.new(:diamond, 'Jack', 11) 
    deck1 = Deck.new([card1, card2])
    deck2 = Deck.new([card3, card4])
    player1 = Player.new('V', deck1)
    player2 = Player.new('Michelle', deck2)
    turn = Turn.new(player1, player2) 
    game = Start.new(player1,player2)
    expect(game).to be_an_instance_of(Start)
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
    @basic_game = Start.new(@player1, @player2) 
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
  end 
end 