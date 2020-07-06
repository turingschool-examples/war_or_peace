class Turn
  attr_reader :basic, :war, :mutually_assured_destruction, :player_1, :player_2, :spoils_of_war

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  def type

    #There has to be a better way. It took me about 16 lines of code to determine
    #the turn type.
    if @player_1.deck.rank_of_card_at(0) != @player_2.deck.rank_of_card_at(0)
      type = :basic

    elsif @player_1.deck.rank_of_card_at(0) == @player_2.deck.rank_of_card_at(0) &&
      @player_1.deck.rank_of_card_at(2) == @player_2.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction

    elsif @player_1.deck.rank_of_card_at(0) == @player_2.deck.rank_of_card_at(0)
      type = :war

    else 'Not a valid turn type'
      end
  end

  def winner_of_turn
    if type == :basic
       if @player_1.deck.rank_of_card_at(0) > @player_2.deck.rank_of_card_at(0)
         winner = @player_1
       elsif @player_2.deck.rank_of_card_at(0) > @player_1.deck.rank_of_card_at(0)
         winner = @player_2
       end

    elsif type == :war
      if @player_1.deck.rank_of_card_at(2) > @player_2.deck.rank_of_card_at(2)
        winner = @player_1
      elsif @player_2.deck.rank_of_card_at(2) > @player_2.deck.rank_of_card_at(2)
        winner = @player_2
      end

    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

   def pile_cards

     #if turn is basic then each player sends top card to spoils pile
     if self.type == :basic
       @spoils_of_war << @player_1.deck.cards[0]
       @player_1.deck.remove_card
       @spoils_of_war << @player_2.deck.cards[0]
       @player_2.deck.remove_card

     #if turn is war then each player sends top three cards to spoils pile

     elsif self.type == :war
       # @spoils_of_war << @player_1.deck.cards[0..2]
       # 3.times {@player_1.deck.remove_card}
       3.times {@spoils_of_war << @player_1.deck.remove_card}
       # @spoils_of_war << @player_2.deck.cards[0..2]
       # 3.times {@player_2.deck.remove_card}
       3.times {@spoils_of_war << @player_2.deck.remove_card}


     #if turn is M.A.D. each player will remove 3 cards from top of deck and
     #removed from play altogether

     else self.type == :mutually_assured_destruction
       3.times  {@player_1.deck.remove_card}
       3.times  {@player_2.deck.remove_card}


     end
     @spoils_of_war
   end

  def award_spoils(winner_of_turn)
    # each card in @spoils_of_war added into the deck array
    #of the winner_of_turn
    @spoils_of_war.each {|spoil| winner_of_turn.deck.add_card(spoil)}
    # winner_of_turn.deck.add_card(@spoils_of_war).flatten!
  end
end
