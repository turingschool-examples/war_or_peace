class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if  strength_of_card(@player1, 0) != strength_of_card(@player2, 0)
      return :basic
    elsif ((strength_of_card(@player1, 0) == strength_of_card(@player2, 0)) && (strength_of_card(@player1, 2) == strength_of_card(@player2, 2)))
      return :mutually_assured_destruction
    elsif strength_of_card(@player1, 0) == strength_of_card(@player2, 0)
      return :war
    end
  end

  def winner
    if type == :mutually_assured_destruction
      return "No Winner"
    end
  
    if type == :basic
    cards_facing_off_index(0)
      return @player1 
    else 
      return @player2
    end
  
    if type ==  :war 
    cards_facing_off_index(2)
      return @player1
    else
      return @player2
    end        
  end

  def pile_cards
    if type == :basic
      shovel_lost_cards_to_spoils(1)
    elsif type == :war
      shovel_lost_cards_to_spoils(3)
    elsif :mutually_assured_destruction   
      shovel_lost_cards_to_spoils(3)
      @spoils_of_war.clear
    end    
  end

  def award_spoils(winner)
    winner.deck.cards.concat(@spoils_of_war)
  end

  def strength_of_card(player, element)
    player.deck.rank_of_card_at(element)
  end

  def cards_facing_off_index(position)
    strength_of_card(@player1, position) > strength_of_card(@player2, position)
  end

  def shovel_lost_cards_to_spoils(number_of_cards)
    number_of_cards.times { @spoils_of_war << ( @player1.deck.remove_card) }
    number_of_cards.times { @spoils_of_war << ( @player2.deck.remove_card) }
  end

end