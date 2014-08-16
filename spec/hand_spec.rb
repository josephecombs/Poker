# -*- coding: utf-8 -*-
require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new( Deck.new ) }
  
  # describe 'setup' do
  #   context 'when passed cards' do
  #     it 'is initialized with cards' do
  #       new_hand = Hand.new
  #       expect(new_hand.cards.empty?).to be(true)
  #     end
  #   end
  #
  #   context 'when passed no cards' do
  #     it 'does not have cards' do
  #       new_hand = Hand.new([Card.new(:spades, :three)])
  #       expect(new_hand.cards.length).to eq(1)
  #     end
  #   end
  #   #
  #   # it 'checks a hand contains 5 cards' do
  #   #   expect(hand.cards).to eq(5)
  #   # end
  #
  #   describe '::draw_from_deck' do
  #     it 'draws 5 cards from passed deck' do
  #       # check that hand.cards.length = 5
  #       # check that deck.length = 46
  #     end
  #
  #   end
  # end
  
  # describe 'checking values' do
  #   let(:flush_hand) { Hand.new([...], Deck.new)}
  #   let(:straight_hand) { ... }
  #
  #   describe '#three_of_a_kind?' do
  #
  #     it "recognizes a true three-of-a-kind" do
  #       expect(three_kind_hand.three_of_a_kind?).to be(true)
  #     end
  #
  #     it 'does not return false positive' do
  #       expect(two_pair.three_of_a_kind?).to be(false)
  #       expect(two_pair.three_of_a_kind?).to be(false)
  #       expect(two_pair.three_of_a_kind?).to be(false)
  #     end
  #   end
  #
  #
  # end
  
  
  describe '#pair?' do
    it 'check to see if a hand with a pair is evaluated to true' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ten),
        Card.new(:spades, :two)]
      expect(hand.pair?).to eq(true)
    end
    it 'check to see if a hand without a pair is evaluated to false' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ten),
        Card.new(:spades, :six)]
      expect(hand.pair?).to eq(false)
    end
  end
  
  describe '#two_pair?' do
    it 'check to see if a hand with a two pair is evaluated to true' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :three),
        Card.new(:hearts, :ten),
        Card.new(:spades, :two)]
      expect(hand.two_pair?).to eq(true)
    end
    it 'check to see if a hand without a two pair is evaluated to false' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ten),
        Card.new(:spades, :six)]
      expect(hand.two_pair?).to eq(false)
    end
  end
  
  describe '#three_of_a_kind?' do
    it 'check to see if a hand with a three_of_a_kind is evaluated to true' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :three),
        Card.new(:clubs, :three),
        Card.new(:hearts, :ten),
        Card.new(:spades, :two)]
      expect(hand.three_of_a_kind?).to eq(true)
    end
    it 'check to see if a hand without a three_of_a_kind is evaluated to false' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ten),
        Card.new(:spades, :six)]
      expect(hand.three_of_a_kind?).to eq(false)
    end
  end
  
  describe '#straight?' do
    it 'check to see if a hand with a straight is evaluated to true' do
      hand.cards_array = [Card.new(:spades, :two),
        Card.new(:hearts, :three),
        Card.new(:clubs, :four),
        Card.new(:hearts, :five),
        Card.new(:spades, :six)]
      expect(hand.straight?).to eq(true)
    end
    it 'check to see if a hand without a straight is evaluated to false' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ten),
        Card.new(:spades, :six)]
      expect(hand.straight?).to eq(false)
    end
    it 'check straight with ace low' do
      hand.cards_array = [Card.new(:spades, :three),
        Card.new(:hearts, :two),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :four),
        Card.new(:spades, :five)]
      expect(hand.straight?).to eq(true)
    end
    it 'check straight with ace high' do
      hand.cards_array = [Card.new(:spades, :king),
        Card.new(:hearts, :queen),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :jack),
        Card.new(:spades, :ten)]
      expect(hand.straight?).to eq(true)
    end
  end
  
  describe '#full_house?' do
    it 'checks to see if a hand with a full_house evaluates to true' do
      hand.cards_array = [Card.new(:spades, :king),
        Card.new(:hearts, :king),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ace),
        Card.new(:spades, :ace)]
      expect(hand.full_house?).to eq(true)
    end
  end
  
  describe '#four_of_a_kind?' do
    it 'checks to see if a hand with a four_of_a_kind evaluates to true' do
      hand.cards_array = [Card.new(:diamonds, :ace),
        Card.new(:hearts, :king),
        Card.new(:clubs, :ace),
        Card.new(:hearts, :ace),
        Card.new(:spades, :ace)]
      expect(hand.four_of_a_kind?).to eq(true)
    end
  end
  
  describe '#flush?' do
    it 'checks to see if a hand with a flush evaluates to true' do
      hand.cards_array = [Card.new(:diamonds, :ace),
        Card.new(:diamonds, :king),
        Card.new(:diamonds, :four),
        Card.new(:diamonds, :three),
        Card.new(:diamonds, :seven)]
      expect(hand.flush?).to eq(true)
    end
  end
  
  describe '#straight_flush?' do
    it 'checks to see if a hand with a straight_flush evaluates to true' do
      hand.cards_array = [Card.new(:diamonds, :ace),
        Card.new(:diamonds, :king),
        Card.new(:diamonds, :queen),
        Card.new(:diamonds, :jack),
        Card.new(:diamonds, :ten)]
      expect(hand.straight_flush?).to eq(true)
    end
  end
  
  describe '#high_card' do
    it 'return the highest card in a hand' do
      hand.cards_array = [Card.new(:diamonds, :ace),
        Card.new(:clubs, :ten),
        Card.new(:diamonds, :queen),
        Card.new(:hearts, :seven),
        Card.new(:diamonds, :four)]
      expect(hand.high_card).to eq(14)
    end
  end
end