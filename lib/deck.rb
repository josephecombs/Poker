# -*- coding: utf-8 -*-
require_relative 'card'
class Deck
  attr_accessor :cards_array
  
  def initialize
    @cards_array = set_deck
  end
  
  def set_deck
    initial_array = []
    Card::SUIT_STRINGS.each_key do |suit|
      Card::VALUE_STRINGS.each_key do |value|
        initial_array << Card.new(suit, value)
      end
    end
    initial_array
  end
  
  def pop_card
    raise "Empty deck" if cards_array.count == 0
    cards_array.shuffle!
    popped_card = cards_array.pop
  end
end

# p Deck.new
