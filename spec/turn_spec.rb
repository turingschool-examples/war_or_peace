require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do

    before(:each ) do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, 'Queen', 12)
      @card7 = Card.new(:heart, '2', 2)
      @card8 = Card.new(:diamond, '2', 2)
    end

  it "exists" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "type will be basic if first cards are not the same" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.type).to eq(:basic)
  end

  it "type will be war if first cards are the same" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.type).to eq(:war)
  end

  it "type will be war if first cards are the same" do
    @deck1 = Deck.new([@card1, @card2, @card8, @card5])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it "winner will be higher first card on basic turn" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.winner(@turn.type).name).to eq("Megan")
  end

  it "winner will be higher second card on war turn" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.winner(@turn.type).name).to eq("Aurora")
  end

  it "will end with no winner" do
    @deck1 = Deck.new([@card1, @card2, @card7, @card5])
    @deck2 = Deck.new([@card4, @card3, @card8, @card6])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    expect(@turn.winner(@turn.type)).to eq("No Winner")
  end

  it "#pile_cards during basic turn will send 1 card from"\
      " both players to spoils" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    type = @turn.type
    @turn.pile_cards(type)
    expect(@turn.spoils_of_war.length).to eq(2)
  end

  it "#pile_cards during war turn will send 3 cards from"\
      " both players to spoils" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    type = @turn.type
    @turn.pile_cards(type)
    expect(@turn.spoils_of_war.length).to eq(6)
  end

  it "#pile_cards during MAD turn will remove 3 cards from"\
      " both players" do
    @deck1 = Deck.new([@card1, @card2, @card8, @card5])
    @deck2 = Deck.new([@card4, @card3, @card7, @card6])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    type = @turn.type
    @turn.pile_cards(type)
    expect(@turn.spoils_of_war.length).to eq(0)
  end

  it "#award_spoils sends cards from spoils to winner" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    type = @turn.type
    @turn.pile_cards(type)
    winner = @turn.winner(@turn.type)
    @turn.award_spoils(winner)
    expect(@player2.deck.cards.length).to eq(5)
  end

  it "#award_spoils should empty spoils after" do
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
    type = @turn.type
    @turn.pile_cards(type)
    winner = @turn.winner(@turn.type)
    @turn.award_spoils(winner)
    expect(@turn.spoils_of_war.length).to eq(0)
  end


      end
