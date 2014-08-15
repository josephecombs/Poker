# -*- coding: utf-8 -*-
require 'rspec'
require 'deck'

describe Deck do
  let (:deck) { Deck.new }
  describe '#cards_array' do
    if 'finds a card in the deck' do
      expect(deck.cards_array.include?(Card.new(:spades, :ace)))
  end
  
end