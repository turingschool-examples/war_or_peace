require "pry"

class Card
  attr_reader :suit, :value, :rank

  def initialize(suit, value, rank)
    @suit   = suit
    @value  = value
    @rank   = rank
  end

end

class Deck

   attr_reader :cards, :index, :high_cards, :new_card

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    cards[index].rank
  end

  def high_ranking_cards
    @high_cards = []
    cards.each do |strong|
      if strong.rank >= 11
        high_cards << strong
      end
    end
    return high_cards
  end

  def percent_high_ranking
    hcount = 0
    card_count = cards.count

    cards.each do |str|
      if str.rank >= 11
        hcount += 1
      end
    end

    percent = ((hcount.to_f / card_count) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(new_card)
    cards.push(new_card)
  end

end

class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    # require "pry"; binding.pry
    if deck.cards.empty?
      true
    else
      false
    end
  end
end

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :discard_pile

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
    @discard_pile   = []
  end

  def type
    if @player1.deck.cards.count >= 1 && @player2.deck.cards.count >= 1
      if @player1.deck.rank_of_card_at(0)  == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) && @player1.deck.cards.count >= 3 && @player2.deck.cards.count >= 3
        :mutually_assured_destruction
      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.cards.count >= 2 && @player2.deck.cards.count >= 2
        :war
      elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) && @player1.deck.cards.count >= 1 && @player2.deck.cards.count >= 1
        :basic
      elsif
        :draw
      end
    elsif
      :draw
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif type == :mutually_assured_destruction
      "No winner"
    else
      "Draw"
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.cards.shift
        @spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :basic
        @spoils_of_war << player1.deck.cards.shift
        @spoils_of_war << player2.deck.cards.shift
    else
    end
  end

  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      @spoils_of_war.each do |win|
        winner.deck.cards << win
      end
    elsif winner == "No winner"
      @spoils_of_war.each do |mad|
        @discard_pile << mad
      end
    else
    end
    @spoils_of_war = []
  end
end

class WeFight

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @round = Turn.new(@player1, @player2)
  end

  def start

    @round_count = 0

    # binding.pry

    # @round = Turn.new(@player1, @player2)

    until @player1.has_lost? == true || @player2.has_lost? == true || @round_count == 1000 || @player1.deck.cards.count <= 1 || @player2.deck.cards.count <= 1 do
      @round_count += 1
        # binding.pry
        if @round.type == :mutually_assured_destruction
          puts "Turn #{@round_count}: *mutually assured destruction* 6 cards removed from play."
        elsif @round.type == :war
          puts "Turn #{@round_count}: WAR - #{@round.winner.name} has won 6 cards."
        elsif @round.type == :basic
          puts "Turn #{@round_count}: #{@round.winner.name} has won 2 cards."
        elsif @round.type == :draw
          break
        end
      @round.pile_cards
      winner = @round.winner
      @round.award_spoils(winner)
    end
    # binding.pry

    if @player1.has_lost? == true
      p "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost? == true
      p "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    elsif @round_count == 1000
      p "--- Draw ---"
    elsif @round.type == :basic
      p "Not enough cards to continue play."
      if @player1.deck.cards.count > @player2.deck.cards.count
        puts "#{@player1.name} has won!"
      else
        puts "#{@player2.name} has won!"
      end
    end

  end
end

card1 = Card.new(:club, "2", 2)
card2 = Card.new(:club, "3", 3)
card3 = Card.new(:club, "4", 4)
card4 = Card.new(:club, "5", 5)
card5 = Card.new(:club, "6", 6)
card6 = Card.new(:club, "7", 7)
card7 = Card.new(:club, "8", 8)
card8 = Card.new(:club, "9", 9)
card9 = Card.new(:club, "10", 10)
card10 = Card.new(:club, "Jack", 11)
card11 = Card.new(:club, "Queen", 12)
card12 = Card.new(:club, "King", 13)
card13 = Card.new(:club, "Ace", 14)
card14 = Card.new(:diamond, "2", 2)
card15 = Card.new(:diamond, "3", 3)
card16 = Card.new(:diamond, "4", 4)
card17 = Card.new(:diamond, "5", 5)
card18 = Card.new(:diamond, "6", 6)
card19 = Card.new(:diamond, "7", 7)
card20 = Card.new(:diamond, "8", 8)
card21 = Card.new(:diamond, "9", 9)
card22 = Card.new(:diamond, "10", 10)
card23 = Card.new(:diamond, "Jack", 11)
card24 = Card.new(:diamond, "Queen", 12)
card25 = Card.new(:diamond, "King", 13)
card26 = Card.new(:diamond, "Ace", 14)
card27 = Card.new(:hearts, "2", 2)
card28 = Card.new(:hearts, "3", 3)
card29 = Card.new(:hearts, "4", 4)
card30 = Card.new(:hearts, "5", 5)
card31 = Card.new(:hearts, "6", 6)
card32 = Card.new(:hearts, "7", 7)
card33 = Card.new(:hearts, "8", 8)
card34 = Card.new(:hearts, "9", 9)
card35 = Card.new(:hearts, "10", 10)
card36 = Card.new(:hearts, "Jack", 11)
card37 = Card.new(:hearts, "Queen", 12)
card38 = Card.new(:hearts, "King", 13)
card39 = Card.new(:hearts, "Ace", 14)
card40 = Card.new(:spades, "2", 2)
card41 = Card.new(:spades, "3", 3)
card42 = Card.new(:spades, "4", 4)
card43 = Card.new(:spades, "5", 5)
card44 = Card.new(:spades, "6", 6)
card45 = Card.new(:spades, "7", 7)
card46 = Card.new(:spades, "8", 8)
card47 = Card.new(:spades, "9", 9)
card48 = Card.new(:spades, "10", 10)
card49 = Card.new(:spades, "Jack", 11)
card50 = Card.new(:spades, "Queen", 12)
card51 = Card.new(:spades, "King", 13)
card52 = Card.new(:spades, "Ace", 14)

playing_cards = [card1, card2, card3, card4, card5, card6, card7,
                card8, card9, card10, card11, card12, card13, card14,
                card15, card16, card17, card18, card19, card20, card21,
                card22, card23, card24, card25, card26, card27, card28,
                card29, card30, card31, card32, card33, card34, card35,
                card36, card37, card38, card39, card40, card41, card42,
                card43, card44, card45, card46, card47, card48, card49,
                card50, card51, card52]

deck1 = Deck.new(playing_cards.sample(26))
deck2 = Deck.new(playing_cards.sample(26))

@player1 = Player.new("Megan", deck1)
@player2 = Player.new("Aurora", deck2)

puts "Welcome to War (or Peace)! This game will be played with 52 cards."
puts "The players today are #{@player1.name} and #{@player2.name}."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
print "> "

input = gets.chomp.upcase

if input == "GO"
  game = WeFight.new(@player1, @player2)
  game.start
else
  puts "Please try again."
end
