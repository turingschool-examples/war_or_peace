class Player
  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def name
    @name
  end

  def deck
    @deck
  end

  def has_lost?
    @deck.cards.empty?
  end

end

class Deck
  def initialize(cards)
    @cards = cards
  end
  def cards
    @cards
  end

  def rank_of_card_at(index)
    return @cards[index].rank
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards.push(card)
  end
end


class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @spoils_of_war = []
    @turn = nil
  end

  def type
    p1_rank_0 = player1.deck.rank_of_card_at(0)
    p2_rank_0 = player2.deck.rank_of_card_at(0)
    p1_rank_2 = player1.deck.rank_of_card_at(2)
    p2_rank_2 = player2.deck.rank_of_card_at(2)
    if p1_rank_0 == p2_rank_0
      if p1_rank_2 == p2_rank_2
        @turn = :mutually_assured_destruction
        return :mutually_assured_destruction
      else
        @turn = :war
        return :war
      end
    else
      @turn = :basic
      return :basic
    end
  end

  def winner
    if @turn == :basic
      p1_rank_0 = player1.deck.rank_of_card_at(0)
      p2_rank_0 = player2.deck.rank_of_card_at(0)
      if p1_rank_0 > p2_rank_0
        return player1
      else
        return player2
      end
    elsif @turn == :war
      p1_rank_2 = player1.deck.rank_of_card_at(2)
      p2_rank_2 = player2.deck.rank_of_card_at(2)
      if p1_rank_2 > p2_rank_2
        return player1
      else
        return player2
      end
    elsif @turn == :mutually_assured_destruction
      return "No Winner"
    else
      return "Must take a turn before deciding winner"
    end
  end

  def pile_cards
    if @turn == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @turn == :war
      @spoils_of_war.push(player1.deck.cards[0], player1.deck.cards[1], player1.deck.cards[2])
      @spoils_of_war.push(player2.deck.cards[0], player2.deck.cards[1], player2.deck.cards[2])
      (1..3).each do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif @turn == :mutually_assured_destruction
      (1..3).each do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
    @spoils_of_war.clear
  end
end

class Card
  def initialize(suit, value, rank)
    @suit = suit
    @value = value
    @rank = rank
  end
  def suit
    @suit
  end
  def value
    @value
  end
  def rank
    @rank
  end

end

def create_deck
  suits = [:heart, :spade, :diamond, :club]
  deck = []
  suits.each do |suit|
    cards = [
        Card.new(suit, 'Ace', 14),
        Card.new(suit, 'King', 13),
        Card.new(suit, 'Queen', 12),
        Card.new(suit, 'Jack', 11),
        Card.new(suit, '10', 10),
        Card.new(suit, '9', 9),
        Card.new(suit, '8', 8),
        Card.new(suit, '7', 7),
        Card.new(suit, '6', 6),
        Card.new(suit, '5', 5),
        Card.new(suit, '4', 4),
        Card.new(suit, '3', 3),
        Card.new(suit, '2', 2)
    ]
    cards.each do |card|
      deck.push(card)
    end
  end
  deck
end

def split_deck_randomly(deck)
  half_deck = []
  (1..26).each do
    rand_card = deck.sample
    half_deck.push(rand_card)
    deck.delete(rand_card)
  end
  half_deck
end

deck = create_deck
  deck1 = Deck.new(split_deck_randomly(deck))
  deck2 = Deck.new(deck)
  p1 = Player.new("Megan", deck1)
  p2 = Player.new("Aurora", deck2)

  (1..100).each do |turn_num|
    if turn_num == 1000000
      puts "---- DRAW ----"
      break
    end
    puts "Megans before: "+p1.deck.cards.length.to_s
    puts "Auroras before: "+p2.deck.cards.length.to_s
    turn = Turn.new(p1, p2)
    turn_type = turn.type
    winner = turn.winner
    turn.pile_cards
    puts "Megans after pile: "+p1.deck.cards.length.to_s
    puts "Auroras after pile: "+p2.deck.cards.length.to_s
    print "Turn "+turn_num.to_s+": "
    if turn_type == :basic
      puts winner.name+ " won "+turn.spoils_of_war.length.to_s+" cards"
      turn.award_spoils(winner)
    elsif turn_type == :war
      puts "WAR - "+winner.name+ " won "+turn.spoils_of_war.length.to_s+" cards"
      turn.award_spoils(winner)
    elsif turn_type == :mutually_assured_destruction
      puts "*mutually assured destruction* 6 cards removed from play"
    end
    puts "Megans after award: "+p1.deck.cards.length.to_s
    puts "Auroras after award: "+p2.deck.cards.length.to_s
    sleep(1)
    if p1.deck.cards.length < 10 || p2.deck.cards.length < 10
      puts "it got below 10"
      break
    end
    if p1.has_lost?
      puts "*~*~*~* "+p2+" has won the game! *~*~*~*"
      break
    elsif p2.has_lost?
      puts "*~*~*~* "+p1+" has won the game! *~*~*~*"
      break
    end

  end
