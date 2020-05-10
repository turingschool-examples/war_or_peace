require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require 'pry'

class WarAndPeaceRunner
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)


  def setup_cards
    all_cards.each_slice(26).to_a.shuffle if all_cards
  end

  def create_decks
    setup_cards.map do |deck_of_cards|
      Deck.new(deck_of_cards)
    end
  end

  def start(player1, player2)
    puts "Welcome to War! (or Peace)"
    puts "This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "--" * 50
    loop do
      case gets.chomp
      when 'GO'
        puts "start the game"
      else
        puts 'enter the correct input'
      end
    end

  end

  private

  def all_cards
    arr = []
    cards_in_full_deck.each do |suit, arr_of_hash|
      arr_of_hash.each {|a| arr << Card.new(suit, a[:value], a[:rank]) }
    end
    arr
  end

  def cards_in_full_deck
    {
      :spade => arranging_rank_values,
      :club => arranging_rank_values,
      :heart => arranging_rank_values,
      :diamond => arranging_rank_values,
    }
  end

  def arranging_rank_values
    card_values_with_rank = []
    CARD_VALUES.each_with_index do |value, index|
      rank = index + 2
      card_values_with_rank << {value: value, rank: rank}
    end
    card_values_with_rank
  end

end


obj = WarAndPeaceRunner.new
decks = obj.create_decks

megan = Player.new("Megan", decks[0])
aurora = Player.new("Aurora", decks[1])

obj.start(megan, aurora)
