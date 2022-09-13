## War or Peace

### Classes/method

#### Card
  - suit
  - value
  - rank

#### Turn
  - ~~#player1~~
  - ~~#player2~~
  - ~~#spoils_of_war~~
  - ~~#basic_turn?~~
  - ~~#war_turn?~~
  - ~~#m_a_d_turn?~~
  - ~~#type~~
  - ~~#winner~~
  - ~~#pile_cards~~
  - ~~#award_spoils(hand_winner)~~
  - ~~#card_count_over_three?~~
  - ~~#card_count_under_three?~~
  - ~~#remove_six_cards~~
  - ~~#send_six_to_spoils~~
  - ~~#send_two_to_spoils~~
  - #basic_turn_winner
  - ~~#war_turn_winner~~
  - ~~#greater_card_at_two~~

#### Game
  - @turn
  - @turn_type
  - @hand_winner
  - @full_deck
  - @deck1
  - @deck2
  - @player1
  - @player2
  - @counter
  - #initialize
  - #start
  - #create_full_deck
  - #shuffle_the_deck
  - #split_deck
  - #create_players
  - #game_over?
  - #two_card_endgame?
  - #two_card_endgame(counter)
  - #one_card_endgame?
  - #one_card_endgame
  - #normal_game_play(counter)
  - #make_turn
  - #game_over
  - #game_loop
  - #player2_wins_basic?
  - #send_card_to_player2
  - #send_card_to_player1