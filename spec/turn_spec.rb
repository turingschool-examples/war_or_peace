require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

  describe 'Class Creation' do

    before (:each) do
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
      expect(@turn).to be_a(Turn)
    end

    it "has readable attributes for player1, player2, and spoils_of_war" do
      expect(@turn.player1.name).to eq("Megan")
      expect(@turn.player2.name).to eq("Aurora")
      expect(@turn.spoils_of_war).to eq([])
    end

  end

  describe ':basic turn type methods' do

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
      @turn.player1
      @turn.player2
    end

    it "has :basic turn type" do
      expect(@turn.type).to eq(:basic)
    end

    it "#winner :basic" do
      expect(@turn.winner).to eq(@player1)
    end

    it "#pile_cards :basic" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to include(@card1, @card3)
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end

    it "#award_spoils :basic" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end

  end

  describe ":war turn type methods" do

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
      @turn.player1
      @turn.player2
    end

    it "has :war turn type" do
      expect(@turn.type).to eq(:war)
    end

    it "#winner :war" do
      expect(@turn.winner).to eq(@player2)
    end

    it "#pile_cards :war" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to include(@card1, @card2, @card5, @card4, @card3, @card6)
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end

    it "#award_spoils :war" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7, @card1, @card2, @card5, @card4, @card3, @card6])
    end

  end

  describe ":mutually_assured_destruction turn type methods" do

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
      @turn.player1
      @turn.player2
    end

    it "has :mutually_assured_destruction turn type" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it "has :mutually_assured_destruction turn type" do
      expect(@turn.winner).to eq("No Winner")
    end

    it "#pile_cards :mutually_assured_destruction" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([])
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end

    it "#award_spoils :mutually_assured_destruction" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end

  end

  describe 'Low Card Count Cases' do

    before(:each) do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @deck1 = Deck.new([@card1, @card2])
      @deck2 = Deck.new([@card4, @card3])
      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)
      @turn = Turn.new(@player1, @player2)
      @turn.player1
      @turn.player2
    end

    it "has less than two cards" do
      expect(@turn.player1.deck.cards.length).to eq(2)
      expect(@turn.player2.deck.cards.length).to eq(2)
      expect(@turn.type).to eq(:draw)
    end

  end
end
