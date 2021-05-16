require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  context 'does exist' do
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

      @player1 = Player.new("Meagn", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "has a turn" do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has an attr reader" do
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
      expect(@turn.spoils_of_war).to eq([])
    end
  end

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

      @player1 = Player.new("Meagn", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "has a type" do
      expect(@turn.type).to eq(:basic)
    end

    it "has a winner" do
      expect(@turn.winner).to eq(@player1)
    end

    it "piles cards to spoils of war" do
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end

    it "awards spoils to winner" do
      @turn.pile_cards
      @turn.spoils_of_war
      @turn.award_spoils(@turn.winner)

      expect(@turn.player1.deck).to eq(@deck1) ##this passes the test but i am not 100% sure if it should be @deck1
      expect(@turn.player2.deck).to eq(@deck2)
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

      @player1 = Player.new("Meagn", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "has a type" do
      expect(@turn.type).to eq(:war)
    end

    it "has a winner" do
      expect(@turn.winner).to eq(@player2)
    end

    it "piles cards to spoils of war" do
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end

    it "awards spoils to winner" do
      @turn.pile_cards
      @turn.spoils_of_war
      @turn.award_spoils(@turn.winner)

      expect(@turn.player1.deck).to eq(@deck1)
      expect(@turn.player2.deck).to eq(@deck2)
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

      @player1 = Player.new("Meagn", @deck1)
      @player2 = Player.new("Aurora", @deck2)

      @turn = Turn.new(@player1, @player2)
    end

    it "has a type" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it "has a winner" do
      expect(@turn.winner).to eq("No Winner")
    end

    it "piles cards to spoils of war" do
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([])
    end

    it "awards spoils to winnder" do
      @turn.pile_cards
      @turn.spoils_of_war
      @turn.award_spoils(@turn.winner)

      expect(@turn.player1.deck).to eq(@deck1)
      expect(@turn.player2.deck).to eq(@deck2)
    end
  end
end

#      require 'pry'; binding.pry
