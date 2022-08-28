class Start
    attr_reader
    attr_accessor

        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are Megan and Aurora."
        p "Type 'GO' to start the game!"
        p "------------------------------------------------------------------"
        start = gets.chomp

        if start == 'GO'
            play_game
        elsif start != 'GO'
            puts "I didn't understand your response. Please try again, capitilization counts!"
            start = gets.chomp
        end
    
    def standard_deck
        card1 = Card.new(:heart, '2', 2)
    	card2 = Card.new(:heart, '3', 3)
    	card3 = Card.new(:heart, '4', 4)
    	card4 = Card.new(:heart, '5', 5)
    	card5 = Card.new(:heart, '6', 6)
    	card6 = Card.new(:heart, '7', 7)
    	card7 = Card.new(:heart, '8', 8)
    	card8 = Card.new(:heart, '9', 9)
    	card9 = Card.new(:heart, '10', 10)
    	card10 = Card.new(:heart, 'Jack', 11)
    	card11 = Card.new(:heart, 'Queen', 12)
    	card12 = Card.new(:heart, 'King', 13)
    	card13 = Card.new(:heart, 'Ace', 14)
    	card14 = Card.new(:diamond, '2', 2)
    	card15 = Card.new(:diamond, '3', 3)
    	card16 = Card.new(:diamond, '4', 4)
    	card17 = Card.new(:diamond, '5', 5)
    	card18 = Card.new(:diamond, '6', 6)
    	card19 = Card.new(:diamond, '7', 7)
    	card20 = Card.new(:diamond, '8', 8)
    	card21 = Card.new(:diamond, '9', 9)
    	card22 = Card.new(:diamond, '10', 10)
    	card23 = Card.new(:diamond, 'Jack', 11)
    	card24 = Card.new(:diamond, 'Queen', 12)
    	card25 = Card.new(:diamond, 'King', 13)
   	 	card26 = Card.new(:diamond, 'Ace', 14)
    	card27 = Card.new(:spade, '2', 2)
    	card28 = Card.new(:spade, '3', 3)
    	card29 = Card.new(:spade, '4', 4)
    	card30 = Card.new(:spade, '5', 5)
    	card31 = Card.new(:spade, '6', 6)
    	card33 = Card.new(:spade, '7', 7)
    	card34 = Card.new(:spade, '8', 8)
    	card35 = Card.new(:spade, '9', 9)
    	card36 = Card.new(:spade, 'Jack', 11)
    	card37 = Card.new(:spade, 'Queen', 12)
    	card38 = Card.new(:spade, 'King', 13)
    	card39 = Card.new(:spade, 'Ace', 14)
    	card40 = Card.new(:club, '2', 2)
    	card41 = Card.new(:club, '3', 3)
		card42 = Card.new(:club, '4', 4)
		card43 = Card.new(:club, '5', 5)
		card44 = Card.new(:club, '6', 6)
		card45 = Card.new(:club, '7', 7)
		card46 = Card.new(:club, '8', 8)
		card47 = Card.new(:club, '9', 9)
		card48 = Card.new(:club, '10', 10)
		card49 = Card.new(:club, 'Jack', 11)
		card50 = Card.new(:club, 'Queen', 12)
		card51 = Card.new(:club, 'King', 13)
    	card52 = Card.new(:club, 'Ace', 14)
    end

    def play_game
        deck1 = Deck.new([card45, card4, card28, card43, card39, card34, card25, card47, card11, card32, card7, card17, card44, card9, card48, card52, card15, card50, card42, card36, card46, card3, card22, card51, card20, card41])
        deck2 = Deck.new([card24, card5, card31, card16, card35, card13, card30, card21, card10, card26, card6, card40, card8, card12, card49, card14, card19, card33, card2, card18, card37, card1, card23, card27, card38, card29])
        player1 = Player1.new("Megan", deck1)
        player2 = Player2.new("Aurora", deck2)
        @turn = Turn.new(@player1, @player2)
    end 
end
