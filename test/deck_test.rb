require "minitest/autorun"
require "minitest/pride"

require "./lib/deck"

describe "Deck" do
  before do
    @cards = [
      Card.new(:diamond, "Queen", 12),
      Card.new(:heart, "Jack", 11),
      Card.new(:club, "King", 13),
      Card.new(:spade, 3, 3),
    ]

    @deck = Deck.new(@cards)
  end

  it "should default to an empty array of cards" do
    deck = Deck.new
    assert_instance_of Array, deck.cards
  end

  it "should take an array of cards" do
    assert_equal @deck.cards, @cards
  end

  describe "#cards" do
    # Most bugs in large code bases come from the case where something was
    # mutated and you didn't expect it to be.

    it "should not be possible to modify the array outside of the deck" do
      # You can imagine the fact that the modifying that innocent array of
      # cards after we've created a deck with those cards shouldn't change
      # the deck itself, right?
      @cards << Card.new(:diamond, "Ace", 14)
      refute_equal @deck.cards, @cards
    end

    it "should return a frozen clone of the cards in the deck" do
      # And, it also stands to reason that the deck should provide the
      # interface for modifying the cards. We don't want to let anything
      # from the outside muck around with the cards in the deck. So, we'll
      # return a clone of the cards in the deck itself and we'll also freeze
      # that object so that no one thinks they can modify it.
      assert @deck.cards.frozen?
    end
  end

  describe "#rank_of_card_at" do
    it "should return the rank of the card at a given index" do
      second_card = @cards[1]
      assert_equal @deck.rank_of_card_at(1), second_card.rank
    end

    it "should return nil if there is card at a given index" do
      index = 100
      non_existent_card = @cards[index]
      assert_nil @deck.rank_of_card_at(index)
    end
  end

  describe "#above_rank" do
    it "should return an array with the cards greater or equal to a rank" do
      face_cards = @deck.above_rank(11)
      assert_equal face_cards.length, 3
    end

    it "should not include a card below that rank" do
      five_of_spades = @cards[3]
      refute_includes @deck.above_rank(11), five_of_spades
    end
  end

  describe "#high_ranking_cards" do
    it "should return an array with the cards greater or equal to a rank" do
      face_cards = @deck.high_ranking_cards
      assert_equal face_cards.length, 3
    end

    it "should not include a card below that rank" do
      five_of_spades = @cards[3]
      refute_includes @deck.high_ranking_cards, five_of_spades
    end
  end

  describe "#percent_high_ranking" do
    it "should return a float" do
      assert_instance_of Float, @deck.percent_high_ranking
    end

    it "should return the percentage of face_cards" do
      assert_instance_of Float, @deck.percent_high_ranking
    end
  end

  describe "#add_card" do
    it "should add a card to the deck" do
      cards_before = @deck.cards.length
      card = Card.new(:spade, "Jack", 11)

      @deck.add_card(card)

      assert_equal @deck.cards.length, cards_before + 1
    end

    it "should blow up if they try to pass in something that is not a card" do
      not_a_card = "Hahahaha"
      assert_raises TypeError do
        @deck.add_card(not_a_card)
      end
    end

    it "should add the card to the bottom of the deck" do
      card = Card.new(:spade, "Jack", 11)

      @deck.add_card(card)

      assert_equal @deck.cards.last, card
    end
  end

  describe "#add_cards" do
    it "should add a card to the deck" do
      cards_before = @deck.cards.length
      cards = [Card.new(:spade, "Jack", 11), Card.new(:diamond, "2", 2)]

      @deck.add_cards(cards)

      assert_equal @deck.cards.length, cards_before + cards.length
    end

    it "should blow up if they try to pass in something that is not a card" do
      not_a_card = "Hahahaha"
      cards = [Card.new(:spade, "Jack", 11), Card.new(:diamond, "2", 2), not_a_card]
      assert_raises TypeError do
        @deck.add_cards(cards)
      end
    end
  end

  describe "#remove_card" do
    it "should remove the card from the deck" do
      cards_before = @deck.cards.length

      @deck.remove_card

      assert_equal @deck.cards.length, cards_before - 1
    end

    it "should add the card to the bottom of the deck" do
      first_card = @deck.cards.at(0)

      card = @deck.remove_card

      assert_equal first_card, card
    end
  end

  describe "#remove_cards" do
    it "should remove the card from the deck" do
      cards_before = @deck.cards.length
      number_of_cards_to_remove = 2

      @deck.remove_cards(number_of_cards_to_remove)

      assert_equal @deck.cards.length, cards_before - number_of_cards_to_remove
    end
  end
end
