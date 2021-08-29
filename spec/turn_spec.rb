require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe "Creates Turn Class" do
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

      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has the players and spoils of war" do
      expect(@turn.player1.name).to eq("Megan")
      expect(@turn.player2.name).to eq("Aurora")
      expect(@turn.spoils_of_war).to eq([])
    end
  end

  describe "Create methods for basic situations" do
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
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end

    it "Has a basic turn type" do

      expect(@turn.type).to eq(:basic)
    end

    it "has a basic winner" do
      winner = @turn.winner
      expect(@turn.winner).to eq(@player1)
    end

    it "has a basic pile_cards" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card3])
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end

    it "has BASIC award_spoils" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
      expect(@player2.deck.cards).to eq([@card4, @card6, @card7])
    end
  end

  describe "War" do
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
    end

    it "has a war type" do
      expect(@turn.type).to eq(:war)
    end

    it "has a winner" do
      winner = @turn.winner
      expect(@turn.winner).to eq(@player2)
    end

    it "has a pile of cards for war" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([@card1, @card4, @card2, @card3, @card5, @card6])
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end

    it "has War award_spoils" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7, @card1, @card4, @card2, @card3, @card5, @card6])
    end

  end

  describe "Create methods for MAD situations" do
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
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
    end

    it "has a MAD type" do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it "has a MAD winner" do
      expect(@turn.winner).to eq("No Winner")
    end

    it "has MAD pile_cards" do
      @turn.pile_cards
      expect(@turn.spoils_of_war).to eq([])
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end

    it "has MAD spoils_of_war" do
      @turn.pile_cards
      @turn.award_spoils
      expect(@player1.deck.cards).to eq([@card8])
      expect(@player2.deck.cards).to eq([@card7])
    end
  end
end
