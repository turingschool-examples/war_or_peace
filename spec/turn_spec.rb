# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Turn do
  context 'Basic' do
    before :each do
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

    it 'exists' do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it 'has a player' do
      expect(@turn.player1).to eq(@player1)
    end

    it 'has a second player' do
      expect(@turn.player2).to eq(@player2)
    end

    it 'has an empty discard pile by default' do
      expect(@turn.spoils_of_war).to eq([])
    end

    it 'has a type of the game' do
      expect(@turn.type).to eq(:basic)
    end

    it 'has a winner for each round' do
      winner = @turn.winner
      expect(winner).to eq(@player1)
      expect(winner).not_to eq(@player2)
    end

    it 'puts cards into the discard pile' do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end

    it 'gives the winner the discard pile' do
      winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(winner)
      expect(@player1.deck).to eq(@deck1)
      expect(@player2.deck).to eq(@deck2)
    end
  end

  context 'War' do
    before :each do
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
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
      @turn = Turn.new(@player1, @player2)
    end

    it 'has a different type' do
      expect(@turn.type).to eq(:war)
    end

    it 'has a winner' do
      winner = @turn.winner
      expect(winner).to eq(@player2)
    end

    it 'puts cards into discard' do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end

    it 'gives winner discard pile' do
      winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(winner)
      expect(@player1.deck).to eq(@deck1)
      expect(@player2.deck).to eq(@deck2)
    end
  end

  context 'mutually Assured Destruction' do
    before :each do
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
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
      @turn = Turn.new(@player1, @player2)
    end

    it 'has a new type' do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it 'does not have a winner' do
      winner = @turn.winner
      expect(winner).to eq('No Winner')
    end

    it 'removes 3 cards from players deck' do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([])
      expect(@player1.deck).to eq(@deck1)
      expect(@player2.deck).to eq(@deck2)
    end
  end

  context 'Helper Methods' do
    before :each do
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
      @player1 = Player.new('Megan', @deck1)
      @player2 = Player.new('Aurora', @deck2)
      @turn = Turn.new(@player1, @player2)
    end

    it 'can return the rank of the first card' do
      expect(@turn.first_card(@player1)).to eq(11)
      expect(@turn.first_card(@player2)).to eq(11)
      expect(@turn.first_card(@player1)).not_to eq(10)
      expect(@turn.first_card(@player1)).not_to eq(10)
    end

    it 'can return the rank of the third card' do
      expect(@turn.third_card(@player1)).to eq(8)
      expect(@turn.third_card(@player2)).to eq(12)
      expect(@turn.third_card(@player1)).not_to eq(11)
      expect(@turn.third_card(@player2)).not_to eq(11)
    end
  end
end
