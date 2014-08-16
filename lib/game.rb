# -*- coding: utf-8 -*-
require_relative 'player'
# require 'player'

class Game
  def initialize
    @deck = Deck.new
    @player1 = Player.new(@deck, 12000, "Joe")
    @player2 = Player.new(@deck, 12000, "Jonathan")
    @pot = 0
  end
  
  def play_game
    counter = 0
    player_arr = [@player1,@player2]
    while @player1.bankroll > 0 && @player2.bankroll > 0 
      p "player1 hand: #{@player1.hand}"
      toggle = player_arr[counter % 2]
      
      
      p "AAAAA"
      gets.chomp
    end
  end
  
end

a = Game.new
a.play_game
