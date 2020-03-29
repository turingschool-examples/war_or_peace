require "minitest/autorun"
require "minitest/pride"

require "./lib/card"

describe "Card" do
  before do
    @card = Card.new(:diamond, "Queen", 12)
  end

  it "should exist" do
    assert_instance_of Card, @card
  end

  it "has resonable attirbues" do
    assert_equal :diamond, @card.suit
    assert_equal "Queen", @card.value
    assert_equal 12, @card.rank
  end
end
