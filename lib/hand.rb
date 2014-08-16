# -*- coding: utf-8 -*-
require_relative 'deck'

class Hand
  attr_accessor :cards_array
  
  HAND_VALUES = {
    :singleton => 0,
    :pair => 1,
    :two_pair => 2,
    :three_of_a_kind => 3,
    :straight => 4,
    :flush => 5,
    :full_house => 6,
    :four_of_a_kind => 7,
    :straight_flush => 8
  }
  
  def initialize(deck, size = 5)
    @deck = deck
    @size = size
    @cards_array = populate_hand
  end
  
  def populate_hand
    ret_arr = []
    @size.times { ret_arr << @deck.pop_card }  
    ret_arr
  end
  
  def current_hand_value
    return 8, high_card if straight_flush?
    return 7, high_card if four_of_a_kind?
    return 6, high_card if full_house?
    return 5, high_card if flush?
    return 4, high_card if straight?
    return 3, high_card if three_of_a_kind?
    return 2, high_card if two_pair?
    return 1, high_card if pair?
    return 0, high_card
  end
  
  def high_card
    @cards_array.map { |card| Card::VALUE_STRINGS[card.card_value] }.sort[-1]
  end
  
  def dup_hand
    dup_hand = @cards_array.dup
  end
  
  def pair?
    test_hand = dup_hand
    test_hand.map! { |card| card.card_value }
    #p test_hand.uniq
    return true if test_hand.uniq.count < @size
    false
  end
  
  def two_pair?
    test_hand = dup_hand
    test_hand.map! { |card| card.card_value }
    return true if test_hand.uniq.count < @size - 1
    false
  end
  
  def three_of_a_kind?
    test_hand = dup_hand
    test_hand.map! { |card| card.card_value }
    test_hand.each do |card|
      return true if test_hand.count(card) == 3
    end
    false
  end
  
  def straight?
    return false if pair?
    test_hand = dup_hand
    is_straight = true
    
    #test with ace high 
    test_hand.map! { |card| Card::VALUE_STRINGS[card.card_value] }
    test_hand.sort!
    (0..@size - 2).each do |i|
      is_straight = false if test_hand[i] != (test_hand[i + 1] - 1) 
    end
    
    if is_straight
      return is_straight
    end
    
    is_straight = true
    
    #test with ace low
    if test_hand.include?(14)
      k = test_hand.index(14)
      test_hand[k] = 1
      test_hand.sort!

      (0..@size - 2).each do |i|
        is_straight = false if test_hand[i] != (test_hand[i + 1] - 1) 
      end
    end
    
    is_straight
  end
  
  def flush?
    test_hand = dup_hand
    test_hand.map! { |card| card.suit }
    return true if test_hand.uniq.count == 1
    false
  end
  
  def full_house?
    test_hand = dup_hand
    test_hand.map! { |card| card.card_value }
    return true if test_hand.uniq.count == @size - 3
    false
  end
  
  def four_of_a_kind?
    test_hand = dup_hand
    test_hand.map! { |card| card.card_value }
    test_hand.each do |card|
      return true if test_hand.count(card) == 4
    end
    false
  end
  
  def straight_flush?
    straight? && flush?
  end
end