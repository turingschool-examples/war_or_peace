class Game
    attr_reader :turn, :deck_of_cards, :shuffled_cards

    def initialize (turn)
        @turn = turn
        @deck_of_cards = []
        @shuffled_deck = []
    end

    def create_deck
        heart_cards = []
        diamond_cards = []
        spade_cards = []
        club_cards = []

        13.times do |i|
            heart_cards << Card.new(:heart, (i+1).to_s, i+1)
        end

        13.times do |i|
            diamond_cards << Card.new(:diamond, (i+1).to_s, i+1)
        end

        13.times do |i|
            spade_cards << Card.new(:spade, (i+1).to_s, i+1)
        end

        13.times do |i|
            club_cards << Card.new(:club, (i+1).to_s, i+1)
        end

        @deck_of_cards = [heart_cards, spade_cards, club_cards, diamond_cards].flatten
    end

    def shuffle_cards
        @shuffled_deck = @deck_of_cards.shuffle
    end

    def split_deck
    # def start
    #     ans = gets.chomp('')
    #     if ans = 'GO'
    # end

    # def next_turn

    # end

    # def shuffle_cards

    # end
end