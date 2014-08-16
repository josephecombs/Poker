# -*- coding: utf-8 -*-
require 'rspec'
require 'player'
require 'hand'

describe Player do
  subject(:player) { Player.new(Deck.new, 10000, "Joe") }
  describe '#recycle_cards' do
    it 'check to see that a' do
      temp = player.hand.dup
      p player.hand.class
      p temp.class
      player.recycle_cards([1,2,3])
      expect(player.hand).to_not eq(temp)
    end
  end
end