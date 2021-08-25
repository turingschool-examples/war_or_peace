require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

describe Turn do
  context 'Initialize' do
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

    it 'has readable attributes' do
      expect(@turn.player1).to eq(@player1)
      expect(@turn.player2).to eq(@player2)
      expect(@turn.spoils_of_war).to eq([])
    end
  end


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

    it 'is a basic turn' do
      expect(@turn.type).to eq(:basic)
    end

    it 'has a winner' do
      @turn.type
      expect(@turn.winner).to eq(@player1)
    end

    it "moves both 'played' cards to the spoils_of_war" do
      expect(@turn.spoils_of_war).to eq([])

      @turn.type
      @turn.winner
      @turn.pile_cards
      expect(@turn.spoils_of_war).to include(@card1)
      expect(@turn.spoils_of_war).to include(@card3)
      expect(@turn.player1.deck.cards).to eq([@card2, @card5, @card8])
      expect(@turn.player2.deck.cards).to eq([@card4, @card6, @card7])
    end

    it 'awards the spoils to the winner' do
      @turn.type
      @winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(@winner)

      expect(@winner.deck.cards).to include(@card1)
      expect(@winner.deck.cards).to include(@card3)
      expect(@player1.deck.cards.size).to eq(5)
      expect(@player2.deck.cards.size).to eq(3)
    end
  end

  context "War" do
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

    it 'is a war turn' do
      expect(@turn.type).to eq(:war)
    end

    it 'has a winner' do
      @turn.type
      expect(@turn.winner).to eq(@player2)
    end

    it 'has many spoils' do
      @turn.type
      @turn.winner
      @turn.pile_cards
      @turn.spoils_of_war

      expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
      expect(@turn.spoils_of_war.size).to eq(6)
    end

    it 'awards the spoils to the winner' do
      @turn.type
      winner = @turn.winner
      @turn.pile_cards
      @turn.spoils_of_war
      @turn.award_spoils(winner)

      expect(@player1.deck.cards.size).to eq(1)
      expect(@player2.deck.cards.size).to eq(7)
      expect(@player2.deck.cards[0]).to eq(@card7)
    end
  end

  context "Mutually Assured Destruction" do
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

    it 'is mutually_assured_destruction' do
      expect(@turn.type).to eq(:mutually_assured_destruction)
    end

    it 'has no winner' do
      @turn.type

      expect(@turn.winner).to eq('No Winner')
    end

    it 'has no spoils' do
      @turn.type
      @turn.winner
      @turn.pile_cards

      expect(@turn.spoils_of_war).to eq([])
    end

    it 'both players lose some cards' do
      @turn.type
      @turn.winner
      @turn.pile_cards
      @turn.spoils_of_war

      expect(@player1.deck.cards.size).to eq(1)
      expect(@player2.deck.cards.size).to eq(1)
    end
  end
end
