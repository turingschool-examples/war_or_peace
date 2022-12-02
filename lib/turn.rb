class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return :war
    # # if player1 rank at 1 or 2 is nil run new winner method. in new winner method,
    # determine circumstances of winning the game for each new situation.
    else 
      return :basic
    end
  end

  def winner
    if type == :basic
      player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    else
      "No Winner"
    end
  end

  # def winner_low_deck
  #   if one card is bigger turn type should be basic, execute game and pile cards, continue game
  #   if there arent enough cards left and cards are the same (war condition), the player with not enough cards loses. 

  # end

  def pile_cards
    if type == :basic
      lost_cards = player1.deck.cards.shift
      @spoils_of_war.unshift(lost_cards)
      # @spoils_of_war.unshift(lost_cards)
      lost_cards = player2.deck.cards.shift
      @spoils_of_war.unshift(lost_cards)
      # @spoils_of_war.unshift(lost_cards).flatten
    elsif type == :war
      lost_cards = player1.deck.cards.shift(3)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
      # @spoils_of_war.unshift(lost_cards)
      lost_cards = player2.deck.cards.shift(3)
      lost_cards.each {|card| @spoils_of_war.unshift(card)}
      # @spoils_of_war.unshift(lost_cards).flatten
    else
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end   
  end


    def award_spoils(winner)
      @spoils_of_war.each do |card|
        winner.deck.cards.push(card)
      end
      @spoils_of_war = []
    end
      







    
  
    

  


end


