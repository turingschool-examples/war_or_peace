require 'rspec'
require 'card.rb'
require 'deck.rb'
require 'player.rb'
require 'turn.rb'
require 'game.rb'

RSpec.describe Game do
  it "exists" do
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:diamond, '6',6)
    deck_1 = Deck.new(card_1)
    deck_2 = Deck.new(card_2)
    player_1 = Player.new('name_1', deck_1)
    player_2 = Player.new('name_2', deck_2)
    turn = Turn.new(player_1, player_2)
    game = Game.new(player_1, player_2)

    expect(game).to be_an_instance_of(Game)
  end

  it "starts" do
    card_1 = Card.new(:heart, 'Jack', 11 )
    card_2 = Card.new(:heart, '10', 10)
    card_3 = Card.new(:heart, '9', 9)
    card_4 = Card.new(:diamond, 'Jack', 11)
    card_5 = Card.new(:heart, '8', 8)
    card_6 = Card.new(:diamond, '8', 8)
    card_7 = Card.new(:heart, '3', 3)
    card_8 = Card.new(:diamond, '2', 2)

    cards_1 = [card_1, card_2, card_5, card_8]
    cards_2 = [card_4, card_3, card_6, card_7]

    deck_1 = Deck.new(cards_1)
    deck_2 = Deck.new(cards_2)

    player_1 = Player.new("Megan", deck_1)
    player_2 = Player.new("Aurora", deck_2)

    game = Game.new(player_1, player_2)

    game.start
    game.play

  end

end
