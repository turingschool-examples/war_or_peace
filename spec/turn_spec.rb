require 'rspec'
require './lib/card.rb'
require 'deck.rb'
require 'player.rb'
require 'turn.rb'

RSpec.describe Turn do
  it "exists" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:diamond, '6',6)
    deck_1 = Deck.new(card_1)
    deck_2 = Deck.new(card_2)
    player_1 = Player.new('name_1', deck_1)
    player_2 = Player.new('name_2', deck_2)
    turn = Turn.new(player_1, player_2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it 'is a game of two players' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)
    cards_1 = [card_1, card_2, card_5, card_8]
    cards_2 = [card_3, card_4, card_6, card_7]

    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])
    expect(deck_1.high_ranking_cards).to eq([card_1])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])
    expect(deck_2.high_ranking_cards).to eq([card_4, card_6])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)
  end

  it 'has an no spoils of war yet' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)
    cards_1 = [card_1, card_2, card_5, card_8]
    cards_2 = [card_3, card_4, card_6, card_7]


    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])
    expect(deck_1.high_ranking_cards).to eq([card_1])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])
    expect(deck_2.high_ranking_cards).to eq([card_4, card_6])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
  end

  it 'checks for a basic game type' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    cards_1 = [card_1, card_2, card_5, card_8]
    cards_2 = [card_3, card_4, card_6, card_7]

    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    deck_1.rank_of_card_at(0)
    deck_2.rank_of_card_at(0)

    expect(player_1.name).to eq("Megan")
    expect(deck_1.rank_of_card_at(0)).to eq(11)
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.rank_of_card_at(0)).to eq(9)
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:basic)
  end

  it 'checks for a basic game winner' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:basic)
    expect(turn.winner).to eq(player_1)
  end

  it 'creates a pile of cards from the game' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:basic)
    expect(turn.winner).to eq(player_1)

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card_8, card_7])
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5])
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6])
  end

  it 'awards spoils to the winner' do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])

    expect(player_2.name).to eq("Aurora")
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6, card_7])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:basic)
    expect(turn.winner).to eq(player_1)

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card_8, card_7])
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5])
    expect(player_2.deck.cards).to eq([card_3, card_4, card_6])

    turn.award_spoils(player_1)

    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8, card_7])
    expect(turn.spoils_of_war).to be_empty
  end

  it 'plays a game of war' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, 'Queen', 12)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])

    expect(player_2.name).to eq("Aurora")
    expect(player_2.deck.cards).to eq([card_4, card_3, card_6, card_7])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
    expect(turn.type).to eq(:war)
    expect(turn.winner).to eq(player_2)

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([card_2, card_5, card_8, card_3, card_6, card_7])
    expect(player_1.deck.cards).to eq([card_1])
    expect(player_2.deck.cards).to eq([card_4])

    turn.award_spoils(player_2)

    expect(player_2.deck.cards).to eq([card_4, card_2, card_5, card_8, card_3, card_6, card_7])
    expect(player_1.deck.cards).to eq([card_1])
    expect(turn.spoils_of_war).to be_empty

  end

  it 'plays a game of mutually assured destruction' do
    card_1 = Card.new(:heart, 'Jack', 11)
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, '8', 8)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_4, card_3, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    expect(player_1.name).to eq("Megan")
    expect(player_1.deck.cards).to eq([card_1, card_2, card_5, card_8])
    expect(player_2.name).to eq("Aurora")
    expect(player_2.deck.cards).to eq([card_4, card_3, card_6, card_7])

    expect(turn.type).to eq(:mutually_assured_destruction)
    expect(turn.winner).to eq("No Winner")

    turn.pile_cards
    expect(turn.spoils_of_war).to be_empty
    expect(player_1.deck.cards).to eq([card_1])
    expect(player_2.deck.cards).to eq([card_4])
  end

end
