# -*- coding: utf-8 -*-
require 'rspec'
require 'deck'


describe Deck do
  let (:deck) { Deck.new }
  
  describe 'setup' do
    it 'starts with 52 cards' do
      #p deck.cards_array      #
      # expect(deck.cards_array[0].to_s).to eq(Card.new(:clubs, :two).to_s)
      # expect(deck.cards_array.uniq.count).to eq(52)
      # expect(deck.cards_array.uniq.count).to_not be < 52
      expect(deck.cards_array.length).to eq(52)
    end
    
    # it 'finds a card in the deck, deck sized correctly' do
    #   #p deck.cards_array
    #   expect(deck.cards_array[0].to_s).to eq(Card.new(:clubs, :two).to_s)
    #   expect(deck.cards_array.uniq.count).to eq(52)
    #   expect(deck.cards_array.uniq.count).to_not be < 52
    # end
  end
  
  describe '#pop_card' do
    it 'returns card object' do
      expect(deck.pop_card.class).to eq(Card)
      # expect(deck.cards_array.count).to eq(51)
    end
    
    it 'removes a card from the deck' do
      deck.pop_card
      expect(deck.cards_array.count).to eq(51)
    end
    
    it 'new cards_array no longer contains popped element' do
      popped_card = deck.pop_card
      expect(deck.cards_array.include?(popped_card)).to eq(false)    
    end
  end
  
end