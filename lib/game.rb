class Game
  attr_reader :game_i
  def initialize
    @game_i = 1
  end
  def start
    require './lib/card.rb'
    require './lib/deck.rb'
    require './lib/player.rb'
    require './lib/turn.rb'

    card_1 = Card.new(:club, "Ace", 14)
    card_2 = Card.new(:club, "2", 2)
    card_3 = Card.new(:club, "3", 3)
    card_4 = Card.new(:club, "4", 4)
    card_5 = Card.new(:club, "5", 5)
    card_6 = Card.new(:club, "6", 6)
    card_7 = Card.new(:club, "7", 7)
    card_8 = Card.new(:club, "8", 8)
    card_9 = Card.new(:club, "9", 9)
    card_10 = Card.new(:club, "10", 10)
    card_11 = Card.new(:club, "Jack", 11)
    card_12 = Card.new(:club, "Queen", 12)
    card_13 = Card.new(:club, "King", 13)
    card_14 = Card.new(:diamond, "Ace", 14)
    card_15 = Card.new(:diamond, "2", 2)
    card_16 = Card.new(:diamond, "3", 3)
    card_17 = Card.new(:diamond, "4", 4)
    card_18 = Card.new(:diamond, "5", 5)
    card_19 = Card.new(:diamond, "6", 6)
    card_20 = Card.new(:diamond, "7", 7)
    card_21 = Card.new(:diamond, "8", 8)
    card_22 = Card.new(:diamond, "9", 9)
    card_23 = Card.new(:diamond, "10", 10)
    card_24 = Card.new(:diamond, "Jack", 11)
    card_25 = Card.new(:diamond, "Queen", 12)
    card_26 = Card.new(:diamond, "King", 13)
    card_27 = Card.new(:hearts, "Ace", 14)
    card_28 = Card.new(:hearts, "2", 2)
    card_29 = Card.new(:hearts, "3", 3)
    card_30 = Card.new(:hearts, "4", 4)
    card_31 = Card.new(:hearts, "5", 5)
    card_32 = Card.new(:hearts, "6", 6)
    card_33 = Card.new(:hearts, "7", 7)
    card_34 = Card.new(:hearts, "8", 8)
    card_35 = Card.new(:hearts, "9", 9)
    card_36 = Card.new(:hearts, "10", 10)
    card_37 = Card.new(:hearts, "Jack", 11)
    card_38 = Card.new(:hearts, "Queen", 12)
    card_39 = Card.new(:hearts, "King", 13)
    card_40 = Card.new(:spades, "Ace", 14)
    card_41 = Card.new(:spades, "2", 2)
    card_42 = Card.new(:spades, "3", 3)
    card_43 = Card.new(:spades, "4", 4)
    card_44 = Card.new(:spades, "5", 5)
    card_45 = Card.new(:spades, "6", 6)
    card_46 = Card.new(:spades, "7", 7)
    card_47 = Card.new(:spades, "8", 8)
    card_48 = Card.new(:spades, "9", 9)
    card_49 = Card.new(:spades, "10", 10)
    card_50 = Card.new(:spades, "Jack", 11)
    card_51 = Card.new(:spades, "Queen", 12)
    card_52 = Card.new(:spades, "King", 13)

    cards_all = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15, card_16, card_17, card_18, card_19, card_20, card_21, card_22, card_23, card_24, card_25, card_26, card_27, card_28, card_29, card_30, card_31, card_32, card_33, card_34, card_35, card_36, card_37, card_38, card_39, card_40, card_41, card_42, card_43, card_44, card_45, card_46, card_47, card_48, card_49, card_50, card_51, card_52]


    cards_half_1 = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15, card_16, card_17, card_18, card_19, card_20, card_21, card_22, card_23, card_24, card_25, card_26]
    cards_half_2 = [card_27, card_28, card_29, card_30, card_31, card_32, card_33, card_34, card_35, card_36, card_37, card_38, card_39, card_40, card_41, card_42, card_43, card_44, card_45, card_46, card_47, card_48, card_49, card_50, card_51, card_52]
    cards_half_1.shuffle!
    cards_half_2.shuffle!
    deck_1 = Deck.new(cards_half_1)
    deck_2 = Deck.new(cards_half_2)

    player1 = Player.new("Billy", deck_1)
    player2 = Player.new("Griffin", deck_2)


    while player1.has_lost? == false && player2.has_lost? == false && @game_i < 1000000
      p @game_i += 1
      turn_1 = Turn.new(player1, player2)
      turn_type = turn_1.type
      winner_1 = turn_1.winner(turn_type)
      turn_1.pile_cards(turn_type)


      turn_1.award_spoils(winner_1)


    end


    if player1.has_lost? == true
      puts "Griffin has defeated Billy in War!"
    elsif player2.has_lost? == true
      puts "Billy has defeated Griffin in War!"
    elsif @game_i == 1000000
      puts "---- DRAW ----"
    else
      puts "404: Correct coding not found"
    end
  end
end

game1 = Game.new
game1.start
