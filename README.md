## War or Peace

This is the starter repo for the BE Mod1 **War or Peace** project.

# Questions/notes 

- I tried to get my type to return the correct type based on the requirements in the protect. I had it wirtten like this but the
expected kept changing from :mutually_assured_destruction to :war. When I 
tried to switch them/change the order of the conditionals, I got more errors
similar. I am a little confused on the order of conditionals and how they work/how to order the ifs, and elsifs. I toyed around with a bunch of different conditionals and ended up finally getting a passing test for all
3 types, but I am not quite sure how I got there.
This is the code I originally wrote and though would work, but didn't

def type 
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at
       :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
       :war
      :mutually_assured_destruction
    end
  end
