require 'rspec'
require './war_or_peace_runner'

RSpec.describe Game do 
    it ' has a valid deck of cards' do 
        game = Game.new
        [:diamond, :heart, :spade, :club].each do |suit|
            ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].each do |value|
                expect(game.full_deck.one? { |card| card.suit == suit && card.value == value } ).to eq(true)
            end
        end 
        expect(game.full_deck.length).to eq(52)
    end 

    it 'deals' do 
        game = Game.new
        game.full_deck.shuffle
        game.deal

        # expect(game.deck1.cards.length).to eq(26)
        expect(game.deck2.cards.length).to eq(26)
        same_cards = game.deck1.cards.any? { |card| game.deck2.cards.include?(card) }
        expect(same_cards).to eq(false)
    end 

end 