require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  context "basic_type" do
    before do
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

    it "#initialize" do
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
      expect(@turn.spoils_of_war).to eq([])
    end

    it "#test_type :basic" do
      expect(@turn.type).to eq(:basic)
    end

    it "#winner :basic" do
      expect(@turn.winner).to eq(@player1)
    end

    it "#pile_cards :basic" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end

    it "#award_spoils :basic" do
      @turn.pile_basic
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end
  end

  context "war_type" do
    before do
      @card1 = Card.new(:heart, 'Jack', 11) 
      @card2 = Card.new(:spade, '10', 10)
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


    it "#initialize" do
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
      expect(@turn.spoils_of_war).to eq([])
    end

    it "#test_type :war" do
      expect(@turn.type).to eq(:war)
    end

    it "#winner :war" do
      expect(@turn.winner).to eq(@player2)
    end

    it "#pile_cards :war" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end

    it "#award_spoils :war" do
      @turn.pile_war
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
    end
  end
  context "mutually_assured_destruction_type" do
    before do
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


    it "#initialize" do
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
      expect(@turn.spoils_of_war).to eq([])
    end

    it "#test_type :mutually_assured_destruction" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it "#winner :mutually_assured_destruction" do
      expect(@turn.winner).to eq("No winner")
    end

    it "#pile_cards :mutually_assured_destruction" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([])
    end

    it "#award_spoils :mutually_assured_destruction" do
      @turn.pile_mutually_assured_destruction
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end
  end

end
