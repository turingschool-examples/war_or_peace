require 'rspec'
require './lib/card'
require 'deck'
require 'player'
require 'turn'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end

  it "can have a deck of multiple cards" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(3)
    expect(deck.cards).to eq([card_1, card_2, card_3])
   end

   it "can call rank" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_3)

    expect(deck.cards).to eq([card_1, card_2, card_3])
    expect(card_1.rank).to eq (12)
    expect(card_3.rank).to eq (14)
   end

  it "can check for high ranking cards" do

    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)

    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_2)
    deck.rank_of_card_at(card_3)

    deck.high_ranking_cards

    expect(card_1.rank).to eq (12)
    expect(card_2.rank).to eq (3)
    expect(card_3.rank).to eq (14)

    expect(deck.cards.count).to eq(3)
    expect(deck.cards).to eq([card_1, card_2, card_3])
    expect(deck.high_ranking_cards.count).to eq(2)
    expect(deck.high_ranking_cards).to eq([card_1, card_3])
  end

  it "can check for the percentage of high ranking cards" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_2)
    deck.rank_of_card_at(card_3)

    expect(card_1.rank).to eq (12)
    expect(card_2.rank).to eq (3)
    expect(card_3.rank).to eq (14)

    deck.high_ranking_cards
    deck.percentage_high_ranking

    expect(deck.cards.count).to eq(3)
    expect(deck.cards).to eq([card_1, card_2, card_3])
    expect(deck.high_ranking_cards.count).to eq(2)
    expect(deck.high_ranking_cards).to eq([card_1, card_3])
    expect(deck.percentage_high_ranking).to eq(67.0)
  end

  it "can add a card(s) to the deck" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    card_4 = Card.new(:club, '5', 5)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_2)
    deck.rank_of_card_at(card_3)

    expect(card_1.rank).to eq (12)
    expect(card_2.rank).to eq (3)
    expect(card_3.rank).to eq (14)

    deck.high_ranking_cards
    deck.percentage_high_ranking

    expect(deck.cards.count).to eq(3)
    expect(deck.cards).to eq([card_1, card_2, card_3])
    expect(deck.high_ranking_cards.count).to eq(2)
    expect(deck.high_ranking_cards).to eq([card_1, card_3])
    expect(deck.percentage_high_ranking).to eq(67.0)

    deck.add_card(card_4)
    deck.high_ranking_cards
    deck.percentage_high_ranking

    expect(deck.cards).to eq([card_1, card_2, card_3, card_4])
    expect(deck.high_ranking_cards.count).to eq(2)
    expect(deck.high_ranking_cards).to eq([card_1, card_3])
    expect(deck.percentage_high_ranking).to eq(50.0)
  end

  it "creates a player with a deck of cards " do

    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    deck.rank_of_card_at(card_1)
    deck.rank_of_card_at(card_2)
    deck.rank_of_card_at(card_3)

    expect(card_1.rank).to eq (12)
    expect(card_2.rank).to eq (3)
    expect(card_3.rank).to eq (14)

    deck.high_ranking_cards

    expect(deck.cards.count).to eq(3)
    expect(player.name).to eq("Clarisa")
    expect(player.deck).to eq([card_1, card_2, card_3])
    expect(deck.high_ranking_cards).to eq([card_1, card_3])
  end

  it "checks if the player has lost" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card_1, card_2, card_3])
    player = Player.new('Clarisa', deck)

    expect(player.deck).to eq([card_1, card_2, card_3])

    player.has_lost?

    expect(player.has_lost?).to be false

    player.remove_card
    player.has_lost?

    expect(player.deck).to eq([card_2, card_3])
    expect(player.has_lost?).to be false

    player.remove_card
    player.has_lost?

    expect(player.deck).to eq([card_3])
    expect(player.has_lost?).to be false

    player.remove_card
    player.has_lost?

    expect(player.deck).to be_empty
    expect(player.has_lost?).to be true

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

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    deck_1.rank_of_card_at(card_1)
    deck_1.rank_of_card_at(card_2)
    deck_2.rank_of_card_at(card_3)
    deck_2.rank_of_card_at(card_4)
    deck_1.rank_of_card_at(card_5)
    deck_2.rank_of_card_at(card_6)
    deck_2.rank_of_card_at(card_7)
    deck_1.rank_of_card_at(card_8)

    expect(card_1.rank).to eq (11)
    expect(card_2.rank).to eq (10)
    expect(card_3.rank).to eq (9)
    expect(card_4.rank).to eq (11)
    expect(card_5.rank).to eq (8)
    expect(card_6.rank).to eq (12)
    expect(card_7.rank).to eq (3)
    expect(card_8.rank).to eq (2)

    deck_1.high_ranking_cards
    deck_2.high_ranking_cards


    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck).to eq([card_1, card_2, card_5, card_8])
    expect(deck_1.high_ranking_cards).to eq([card_1])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck).to eq([card_3, card_4, card_6, card_7])
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

    deck_1 = Deck.new([card_1, card_2, card_5, card_8])
    deck_2 = Deck.new([card_3, card_4, card_6, card_7])

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    turn = Turn.new(player_1, player_2)

    deck_1.rank_of_card_at(card_1)
    deck_1.rank_of_card_at(card_2)
    deck_2.rank_of_card_at(card_3)
    deck_2.rank_of_card_at(card_4)
    deck_1.rank_of_card_at(card_5)
    deck_2.rank_of_card_at(card_6)
    deck_2.rank_of_card_at(card_7)
    deck_1.rank_of_card_at(card_8)

    expect(card_1.rank).to eq (11)
    expect(card_2.rank).to eq (10)
    expect(card_3.rank).to eq (9)
    expect(card_4.rank).to eq (11)
    expect(card_5.rank).to eq (8)
    expect(card_6.rank).to eq (12)
    expect(card_7.rank).to eq (3)
    expect(card_8.rank).to eq (2)

    deck_1.high_ranking_cards
    deck_2.high_ranking_cards
    turn.spoils_of_war


    expect(player_1.name).to eq("Megan")
    expect(deck_1.cards.count).to eq(4)
    expect(player_1.deck).to eq([card_1, card_2, card_5, card_8])
    expect(deck_1.high_ranking_cards).to eq([card_1])

    expect(player_2.name).to eq("Aurora")
    expect(deck_2.cards.count).to eq(4)
    expect(player_2.deck).to eq([card_3, card_4, card_6, card_7])
    expect(deck_2.high_ranking_cards).to eq([card_4, card_6])

    expect(turn.player_1).to eq(player_1)
    expect(turn.player_2).to eq(player_2)

    expect(turn.spoils_of_war).to be_empty
  end


end


