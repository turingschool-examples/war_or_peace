require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
let(:card1)  { Card.new(:heart, 'Jack', 11)}
let(:card2)  { Card.new(:heart, '10', 10)}    
let(:card3)  { Card.new(:heart, '9', 9)}    
let(:card4)  { Card.new(:diamond, 'Jack', 11)}    
let(:card5)  { Card.new(:heart, '8', 8)}    
let(:card6)  { Card.new(:diamond, 'Queen', 12)}    
let(:card7)  { Card.new(:heart, '3', 3)}    
let(:card8)  { Card.new(:diamond, '2', 2)} 
let(:deck1)  { Deck.new([card1, card2, card5, card8]) }
let(:deck2)  { Deck.new([card3, card4, card6, card7]) }
let(:player1)  { Player.new("Megan", deck1)}    
let(:player2)  { Player.new("Aurora", deck2)}    
let(:turn)  { Turn.new(player1, player2)}    

  context "1st interaction patterns" do
    it 'should be a class, have two player attributes, a spoils array' do
      expect(turn).to be_a Turn
      expect(turn.player1).to eq(player1)
      expect(turn.player2.name).to eq("Aurora")
      expect(turn.spoils_of_war).to eq([])
    end

    it 'should have a :basic turn type and a winner for that type' do 
      expect(turn.type).to eq(:basic)
      winner = turn.winner
      expect(winner).to eq (player1)
    end

    it 'should have a #pile_cards that pushes 2 cards to #spoil_of_war for :basic type' do      
      expect(turn.spoils_of_war.count).to eq 0
      winner = turn.winner
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1,card3])
      turn.award_spoils(winner)
    end

    it 'should add cards from #spoil_of_war to the winners cards' do
      expect(player1.deck.cards.count).to eq 4
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck).to eq(deck1)
      # require 'pry';binding.pry
      # expect(player1.deck.cards).to eq ([card1, card2, card5, card8, card3])
      expect(player1.deck.cards.count).to eq 5
      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)
      # expect(player1.deck1.count).to eq 4
    end



  end

end