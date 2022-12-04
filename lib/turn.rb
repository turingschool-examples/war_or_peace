class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards.length < 3 || player2.deck.cards.length < 3
      return :special
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    else 
      return :basic
    end
  end

  def winner
    if type == :special
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      lost_cards = player1.deck.cards.shift
      @spoils_of_war.unshift(lost_cards)
      lost_cards = player2.deck.cards.shift
      @spoils_of_war.unshift(lost_cards)
    elsif type == :war
      lost_cards = player1.deck.cards.shift(3)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
      lost_cards = player2.deck.cards.shift(3)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
    elsif type == :special
      lost_cards = player1.deck.cards.shift(2)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
      lost_cards = player2.deck.cards.shift(2)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
    else 
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end   
  end

  def award_spoils(winner)
    @spoils_of_war.shuffle!.each do |card|
      winner.deck.cards.push(card)
      end
    @spoils_of_war = []
  end
      
end


