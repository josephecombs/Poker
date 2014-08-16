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
      @hand.cards_array[pos] = nil
      @hand.cards_array[pos] = @hand.deck.pop_card
    end
  end

  #methods called on players within the game
  def get_action
    begin
      puts "#{@name}, current bankroll #{@bankroll} enter f,r, or c, and amount to put in pot (r,1200), (c,1234), (f,0):"
      options = gets.chomp.split(',')
      puts "invalid bet size" if options.last.to_i > @bankroll
    end until options.last.to_i <= @bankroll
    
    @bankroll -= options.last.to_i
    puts "#{name}'s action was #{options.first}, putting in #{options.last} into the pot"
    return options.first, options.last
  end
  
  def give_amount(amount)
    p @name
    p "@bankroll = #{@bankroll}" 
    @bankroll += amount
    p "@bankroll = #{@bankroll}" 
  end
  
  def get_recycle_cards
    puts "#{name}, enter the comma-separated 0-indexed positions of the cards you wish to recycle:"
    options = gets.chomp.split(',')
    options.map! { |ele| ele.to_i } unless options.empty?
    recycle_cards(options)
  end
  
end