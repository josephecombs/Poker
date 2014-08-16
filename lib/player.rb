# -*- coding: utf-8 -*-
require_relative 'hand'

class Player
  attr_accessor :hand, :bankroll, :deck, :name
  
  def initialize(deck, bankroll = 10000, name)
    @hand = Hand.new(deck)
    @bankroll = bankroll
    @deck = deck
    @name = name
  end

  def recycle_cards(arr)
    arr.each do |pos|
      @hand[pos] = nil
      @hand[pos] = @hand.deck.pop_card
    end  
  end

  def get_bet
    "#{name}, enter f,r, or c, and optionally, bet size (r,1200), (c,1234), (f,0):"
    options = gets.chomp.split(',')
    bankroll -= options.last
    return options.first, options.last
  end
  
  def get_recycle_cards
    "#{name}, enter the comma-separated 0-indexed positions of the cards you wish to recycle:"
    options = gets.chomp.split(',')
    recycle_cards(options)
  end
  
end