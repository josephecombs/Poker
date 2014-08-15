# -*- coding: utf-8 -*-
require 'rspec'
require 'card'

describe Card do 
  let(:card) { Card.new(:spades, :ace) }
  
  describe '#to_s' do
    it 'prints the card value and suit' do
      expect(card.to_s).to eq("A♠")
    end
  end
  
  describe '#suit' do
    it 'acesses card suit' do
      expect(card.suit).to eq(:spades)
    end
  end
  
  describe '#value' do
    it 'acesses card value' do
      expect(card.value).to eq(:ace)
    end
  end
end
