require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
before do
  @card1 = Card.new(:heart, 'Jack', 11)
  @card2 = Card.new(:heart, '10', 10)
  @card3 = Card.new(:heart, '9', 9)
  @card4 = Card.new(:diamond, 'Jack', 11)
  @card5 = Card.new(:heart, '8', 8)
  @card6 = Card.new(:diamond, 'Queen', 12)
  @card7 = Card.new(:heart, '3', 3)
  @card8 = Card.new(:diamond, '2', 2)
end

require 'pry'
  it "exists, has attributes, can simulate turns" do

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    meg = Player.new("Megan", deck1)
    aur = Player.new("Aurora", deck2)

    turn = Turn.new(meg, aur)

    expect(turn).to be_an_instance_of(Turn)
    expect(turn.player1).to eq(meg)
    expect(turn.player2).to eq(aur)
    expect(turn.spoils_of_war).to eq([])
  end

  it "turn type basic, determines turn winner, awards spoils to winner" do

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card3, @card4, @card6, @card7])

    meg = Player.new("Megan", deck1)
    aur = Player.new("Aurora", deck2)
# what is the name of the variable meg here? Instance? Local? and what is player1 called?
    turn = Turn.new(meg, aur)
    turn.type
    expect(turn.type).to eq(:basic)
    expect(turn.winner).to eq(meg)
    expect(turn.pile_cards).to eq([@card1, @card3])
    turn.award_spoils
# why are these decks not deck1 and deck2? Why are they just deck?
    expect(meg.deck.cards).to eq([@card2, @card5, @card8, @card1, @card3])
    expect(aur.deck.cards).to eq([@card4, @card6, @card7])
  end

  it "turn type war, determines turn winner, awards spoils to winner" do

    deck1 = Deck.new([@card1, @card2, @card5, @card8])
    deck2 = Deck.new([@card4, @card3, @card6, @card7])

    meg = Player.new("Megan", deck1)
    aur = Player.new("Aurora", deck2)

    turn = Turn.new(meg, aur)

    expect(turn.type).to eq(:war)
    expect(turn.winner).to eq(aur)
    expect(turn.pile_cards).to eq([@card1, @card4, @card2, @card3, @card5, @card6])
    turn.award_spoils
    expect(meg.deck.cards).to eq([@card8])
    expect(aur.deck.cards).to eq([@card7, @card1, @card4, @card2, @card3, @card5, @card6])
  end

  it "turn type mutually assured destruction, determines turn winner, awards spoils to winner" do
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

    meg = Player.new("Megan", deck1)
    aur = Player.new("Aurora", deck2)

    turn = Turn.new(meg, aur)

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(turn.winner).to eq("No Winner")
    turn.pile_cards
    expect(meg.deck.cards).to eq([card8])
    expect(aur.deck.cards).to eq([card7])
  end

end
