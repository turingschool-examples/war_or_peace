class Game
    attr_reader :turn, :cards, :shuffled_cards, :individual_deck

    def initialize (turn)
        @turn = turn
        @cards = []
        @shuffled_deck = []
        @individual_deck = []
    end

    def create_cards
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

        @cards = [heart_cards, spade_cards, club_cards, diamond_cards].flatten
    end

    def shuffle_cards
        @shuffled_deck = @cards.shuffle
    end

    def split_deck
        @individual_deck = @shuffled_deck.each_slice(26).to_a
    end

    def start
        self.create_cards
        self.shuffle_cards
        self.split_deck
    end

end