require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do 
  # before (:each) do 
  #   @card1 = Card.new(:heart, 'Jack', 11)
  #   @card2 = Card.new(:heart, '10', 10) 
  #   @card3 = Card.new(:heart, '9', 9) 
  #   @card4 = Card.new(:diamond, 'Jack', 11)  
  #   @card5 = Card.new(:heart, '8', 8) 
  #   @card6 = Card.new(:diamond, 'Queen', 12)
  #   @card7 = Card.new(:heart, '3', 3)
  #   @card8 = Card.new(:diamond, '2', 2)
  #   @deck1 = Deck.new([@card1, @card2, @card5, @card8])
  #   @deck2 = Deck.new([@card3, @card4, @card6, @card7])
  #   @player1 = Player.new('Dug', deck1)
  #   @player2 = Player.new('Fran', deck2)
  # end 

  describe '#initialize' do 
    it 'is an instance of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn).to be_instance_of Turn
    end

    it 'has a first player' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.player1).to eq(player1)
    end 

    it 'has a second player' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2) 
      
      expect(turn.player2).to eq(player2)
    end 

    it 'has no spoils of war by default' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.spoils_of_war).to eq([])
    end 
  end  

  describe '#type' do 
    it 'is basic if the rank at 0 index is not the same' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(9)
      expect(turn.type).to eq(:basic)
    end

    it 'is war if the rank at 0 index is the same' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
    end

    it 'is war if one player has < 3 cards' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card5, card6])
      deck2 = Deck.new([card4, card3])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
    end

    it 'is mutually assured destruction if rank at 0 index and 2 index are the same' do
      card1 = Card.new(:heart, 'Jack', 11) 
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.type).to eq(:mutually_assured_destruction)
    end 
  end 

  describe '#winner'do 
    it 'will return the player that won basic' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(9)
      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)
    end 

    it 'will return the player the player that wins a normal war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(12)
      expect(turn.winner).to eq(player2)
    end 

    it 'will return the player the player that wins an abnormal war' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      deck1 = Deck.new([card1, card2, card5, card6])
      deck2 = Deck.new([card4, card3])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)
      
      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
      expect(turn.winner).to eq(player1)
    end
    
    it 'will return no winner when it is mutually assured destruction' do 
      card1 = Card.new(:heart, 'Jack', 11) 
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.type).to eq(:mutually_assured_destruction)
      expect(turn.winner).to eq("No Winner")
    end 
  end

  describe '#pile_cards' do 
    it 'each player sends the top card to the spoils pile' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(9)
      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
    end 

    it 'each player sends three cards to spoils pile' do 
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
    end

    it 'three cards are removed from each player deck and removed from game' do
      card1 = Card.new(:heart, 'Jack', 11) 
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.type).to eq(:mutually_assured_destruction)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
    end 
  end

  describe '#award_spoils' do 
    it 'adds spoils to the winner for basic' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(9)
      expect(turn.type).to eq(:basic)
      expect(turn.winner).to eq(player1)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card3])
      turn.award_spoils(player1)
      expect(turn.spoils_of_war).to eq([])
      expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
    end

    it 'add spoils to the winner for war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.type).to eq(:war)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(12)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
      turn.award_spoils(player2)
      expect(turn.spoils_of_war).to eq([])
      expect(turn.player2.deck.cards).to eq([card7, card1, card4, card2, card3, card5, card6])
    end 

    it 'has no spoils awarded in mutually assured destruction' do
      card1 = Card.new(:heart, 'Jack', 11) 
      card2 = Card.new(:heart, '10', 10) 
      card3 = Card.new(:heart, '9', 9) 
      card4 = Card.new(:diamond, 'Jack', 11)  
      card5 = Card.new(:heart, '8', 8) 
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new('Dug', deck1)
      player2 = Player.new('Fran', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player1.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.player2.deck.rank_of_card_at(0)).to eq(11)
      expect(turn.player2.deck.rank_of_card_at(2)).to eq(8)
      expect(turn.type).to eq(:mutually_assured_destruction)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
      turn.award_spoils("No Winner")
      expect(turn.player1.deck.cards).to eq([card8])
      expect(turn.player2.deck.cards).to eq([card7])
    end
  end 
end 