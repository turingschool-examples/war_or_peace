require 'rspec'
require 'pry'
require_relative './lib/card'
require_relative './lib/deck'
require_relative './lib/player'
require_relative './lib/turn'

RSpec describe War_Or_Peace do
  let(:card1) {Card.new(:heart, '2', 2)}
  let(:card2) {Card.new(:heart, '3', 3)}
  let(:card3) {Card.new(:heart, '4', 4)}
  let(:card4) {Card.new(:heart, '5', 5)}
  let(:card5) {Card.new(:heart, '6', 6)}
  let(:card6) {Card.new(:heart, '7', 7)}
  let(:card7) {Card.new(:heart, '8', 8)}
  let(:card8) {Card.new(:heart, '9', 9)}
  let(:card9) {Card.new(:heart, '10', 10)}
  let(:card10) {Card.new(:heart, 'Jack', 11)}
  let(:card11) {Card.new(:heart, 'Queen', 12)}
  let(:card12) {Card.new(:heart, 'King', 13)}
  let(:card13) {Card.new(:heart, 'Ace', 14)}

  let(:card14) {Card.new(:diamond, '2', 2)}
  let(:card15) {Card.new(:diamond, '3', 3)}
  let(:card16) {Card.new(:diamond, '4', 4)}
  let(:card17) {Card.new(:diamond, '5', 5)}
  let(:card18) {Card.new(:diamond, '6', 6)}
  let(:card19) {Card.new(:diamond, '7', 7)}
  let(:card20) {Card.new(:diamond, '8', 8)}
  let(:card21) {Card.new(:diamond, '9', 9)}
  let(:card22) {Card.new(:diamond, '10', 10)}
  let(:card23) {Card.new(:diamond, 'Jack', 11)}
  let(:card24) {Card.new(:diamond, 'Queen', 12)}
  let(:card25) {Card.new(:diamond, 'King', 13)}
  let(:card26) {Card.new(:diamond, 'Ace', 14)}

  let(:card27) {Card.new(:club, '2', 2)}
  let(:card28) {Card.new(:club, '3', 3)}
  let(:card29) {Card.new(:club, '4', 4)}
  let(:card30) {Card.new(:club, '5', 5)}
  let(:card31) {Card.new(:club, '6', 6)}
  let(:card32) {Card.new(:club, '7', 7)}
  let(:card33) {Card.new(:club, '8', 8)}
  let(:card34) {Card.new(:club, '9', 9)}
  let(:card35) {Card.new(:club, '10', 10)}
  let(:card36) {Card.new(:club, 'Jack', 11)}
  let(:card37) {Card.new(:club, 'Queen', 12)}
  let(:card38) {Card.new(:club, 'King', 13)}
  let(:card39) {Card.new(:club, 'Ace', 14)}

  let(:card40) {Card.new(:spade, '2', 2)}
  let(:card41) {Card.new(:spade, '3', 3)}
  let(:card42) {Card.new(:spade, '4', 4)}
  let(:card43) {Card.new(:spade, '5', 5)}
  let(:card44) {Card.new(:spade, '6', 6)}
  let(:card45) {Card.new(:spade, '7', 7)}
  let(:card46) {Card.new(:spade, '8', 8)}
  let(:card47) {Card.new(:spade, '9', 9)}
  let(:card48) {Card.new(:spade, '10', 10)}
  let(:card49) {Card.new(:spade, 'Jack', 11)}
  let(:card50) {Card.new(:spade, 'Queen', 12)}
  let(:card51) {Card.new(:spade, 'King', 13)}
  let(:card52) {Card.new(:spade, 'Ace', 14)}
end
