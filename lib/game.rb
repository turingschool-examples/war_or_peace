# require './lib/card'
# require './lib/player'
# require './lib/turn'

# class Game
#     attr_reader :full_deck

#     def initialize
#         @full_deck = []
#     end

#     def make_deck
#         card1 = Card.new(:diamond, '2', 2)
#         card2 = Card.new(:diamond, '3', 3)
#         card3 = Card.new(:diamond, '4', 4)
#         card4 = Card.new(:diamond, '5', 5)
#         card5 = Card.new(:diamond, '6', 6)
#         card6 = Card.new(:diamond, '7', 7)
#         card7 = Card.new(:diamond, '8', 8)
#         card8 = Card.new(:diamond, '9', 9)
#         card9 = Card.new(:diamond, '10', 10)
#         card10 = Card.new(:diamond, 'Jack', 11)
#         card11 = Card.new(:diamond, 'Queen', 12)
#         card12 = Card.new(:diamond, 'King', 13)
#         card13 = Card.new(:diamond, 'Ace', 14)

#         card14 = Card.new(:heart, '2', 2)
#         card15 = Card.new(:heart, '3', 3)
#         card16 = Card.new(:heart, '4', 4)
#         card17 = Card.new(:heart, '5', 5)
#         card18 = Card.new(:heart, '6', 6)
#         card19 = Card.new(:heart, '7', 7)
#         card20 = Card.new(:heart, '8', 8)
#         card21 = Card.new(:heart, '9', 9)
#         card22 = Card.new(:heart, '10', 10)
#         card23 = Card.new(:heart, 'Jack', 11)
#         card24 = Card.new(:heart, 'Queen', 12)
#         card25 = Card.new(:heart, 'King', 13)
#         card26 = Card.new(:heart, 'Ace', 14)

#         card27 = Card.new(:club, '2', 2)
#         card28 = Card.new(:club, '3', 3)
#         card29 = Card.new(:club, '4', 4)
#         card30 = Card.new(:club, '5', 5)
#         card31 = Card.new(:club, '6', 6)
#         card32 = Card.new(:club, '7', 7)
#         card33 = Card.new(:club, '8', 8)
#         card34 = Card.new(:club, '9', 9)
#         card35 = Card.new(:club, '10', 10)
#         card36 = Card.new(:club, 'Jack', 11)
#         card37 = Card.new(:club, 'Queen', 12)
#         card38 = Card.new(:club, 'King', 13)
#         card39 = Card.new(:club, 'Ace', 14)

#         card40 = Card.new(:spade, '2', 2)
#         card41 = Card.new(:spade, '3', 3)
#         card42 = Card.new(:spade, '4', 4)
#         card43 = Card.new(:spade, '5', 5)
#         card44 = Card.new(:spade, '6', 6)
#         card45 = Card.new(:spade, '7', 7)
#         card46 = Card.new(:spade, '8', 8)
#         card47 = Card.new(:spade, '9', 9)
#         card48 = Card.new(:spade, '10', 10)
#         card49 = Card.new(:spade, 'Jack', 11)
#         card50 = Card.new(:spade, 'Queen', 12)
#         card51 = Card.new(:spade, 'King', 13)
#         card52 = Card.new(:spade, 'Ace', 14)

#         @full_deck = [card1, card2, card3, card4, card5, card6, card7, card8,
#                     card9, card10, card11, card12, card13, card14, card15, 
#                     card16, card17, card18, card19, card20, card21, card22, 
#                     card23, card24, card25, card26, card27, card28, card29, 
#                     card30, card31, card32, card33, card34, card35, card36,
#                     card37, card38, card39, card40, card41, card42, card43, 
#                     card44, card45, card46, card47, card48, card49, card50, 
#                     card51, card52]
#     end

#     def split_deck
#         3.times do
#             @full_deck.shuffle!
#         end

#         deck1 = @full_deck[0..25]
#         deck2 = @full_deck[26..51]

#         player1 = Player.new('Megan', deck1)
#         player2 = Player.new('Aurora', deck2)
#     end

#     def start
#         puts "Welcome to War! (or Peace) This game will be played with 52 cards."
#         puts "The players today are Megan and Aurora."
#         puts "Type 'GO' to start the game!"
#         puts "------------------------------------------------------------------"
    
#         user = gets.chomp.upcase
#         if user == "GO"
#             count = 0
#             loop do
#                 count += 1
#                 turn.winner
#                 turn.pile_cards
#                     if player1.has_lost? == true || player2.has_lost? == true || count == 1000000
#                         break
                    
#                     else
#                        turn.award_spoils(winner)
#                        if @spoils_of_war.length == 2 && turn.type == :basic 
#                         puts "Turn #{count}: #{turn.winner.name} won 2 cards"
#                        elsif @spoils_of_war.length == 6 && turn.winner != "No Winner"
#                         puts "Turn #{count}: WAR - #{turn.winner.name} won 6 cards"
#                        else
#                         puts "Turn #{count}: *mutually assured destruction* 6 cards removed from play"
#                        end

#                         @spoils_of_war.clear
#                     end
                
#             end
#         end
        
#         if player1.deck.cards.length == 0
#             puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
#         elsif player2.deck.cards.length == 0
#             puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
#         else
#             puts "---- DRAW ----"
#         end
#     end
# end




#     def initialize
#         @full_deck = [] 
#         suits = ('heart', 'club', 'club', 'spade')
#         values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'] 
#         ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

#         suits.each do |suit|
#             values.each do |value|
#                 ranks.each do |rank|
#                     card = Card.new(value, rank, suit)
#                     @full_deck << card
#                 end
#             end
#         end
#     end