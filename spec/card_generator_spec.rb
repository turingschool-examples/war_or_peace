require './lib/card'
require './lib/deck'
require './lib/card_generator'
require 'csv'

describe CardGenerator do
    before (:each) do
        #Create example file to read
        # file = CSV.generate do |csv|
        #     csv << ["2", " Heart", " 2"]
        #     csv << ["Jack", " Diamond", " 11"]
        #     csv << ["Ace", " Spade", " 14"]
        # end
        # file = file.split("\n")
        # file.each_with_index {|card, i| file[i] = card.split(",")}
        
        file = CSV.read("test_cards.txt")
        
        @card_generator = CardGenerator.new("test_cards.txt")
    end

    it 'exists' do
        expect(@card_generator).to be_a(CardGenerator)
    end

    xit 'can create deck' do

    end
end