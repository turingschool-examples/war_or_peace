require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  context 'type :basic' do
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

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has a turn type" do
      expect(@turn.type).to eq(:basic)
    end

    it "has a winner" do
      expect(@turn.winner).to eq(@player1)
    end

    it "start with empty array for spoils_of_war" do
      expect(@turn.spoils_of_war).to eq([])
    end

    it "adds to the pile_cards" do # i am here
      @turn.player1
      @turn.player2
      expect(@turn.pile_cards).to eq([@card1, @card3])
      # player1 and player2 have to go before running .pile_cards
      @turn.player1
      @turn.player2

      expect(@turn.pile_cards).to eq([@card1, @card3, @card2, @card4])
    end

    it "will award spoils_of_war to winner" do
      @turn.player1
      @turn.player2

      winner = @turn.winner

    require "pry"; binding.pry
      expect(@turn.type).to eq(:basic) #works up until here, below doesn't
      # @turn.pile_cards
      # @turn.award_spoils(winner)
      #
      # # expect(@turn.award_spoils(winner)).to eq([])
      # expect(@player2.deck.cards).to eq([@card3, @card6, @card7, @card1, @card4])

      

    end

    it "has a turn type" do
      expect(@turn.type).to eq(:war)
      winner = @turn.winner
      @turn.pile_cards
      @turn.spoils_of_war
      @turn.award_spoils(winner)

      expect(@turn.type).to eq(:basic)
    end
  end

  context 'type :war' do
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

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has a turn type" do
      expect(@turn.type).to eq(:war)
    end

    it "has a winner" do
      expect(@turn.winner).to eq(@player2)
    end

    it "has a pile_cards" do
      @turn.player1
      @turn.player2

      expect(@turn.pile_cards).to eq([@card1, @card4])
      # player1 and player2 have to go before running .pile_cards
      @turn.player1
      @turn.player2
      expect(@turn.pile_cards).to eq([@card1, @card4, @card2, @card3])
    end

    it "start with empty array for spoils_of_war" do
      expect(@turn.spoils_of_war).to eq([])

      @turn.player1
      @turn.player2
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card4])
    end

    it "will award spoils_of_war to winner" do
      @turn.player1
      @turn.player2

      winner = @turn.winner

      expect(@turn.type).to eq(:war)
      @turn.pile_cards
      @turn.award_spoils(winner)

      # expect(@turn.award_spoils(winner)).to eq([])
      expect(@player2.deck.cards).to eq([@card3, @card6, @card7, @card1, @card4])
    end
  end

  context 'type :mutually_assured_destruction' do
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

      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has a turn type" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it "has a winner" do
      expect(@turn.winner).to eq("No Winner")
    end

    it "adds to the pile_cards" do
      expect(@turn.pile_cards).to eq([@card1, @card4])
    end

    it "start with empty array for spoils_of_war" do
      expect(@turn.spoils_of_war).to eq([])
    end

    it "starts with each player having a deck" do
      expect(@player1.deck.cards).to eq([@card1, @card2, @card5, @card8])
      expect(@player2.deck.cards).to eq([@card4, @card3, @card6, @card7])
    end
  end
end
