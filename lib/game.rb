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
      p "player1 hand: #{@player1.hand.cards_array}"
      p "player2 hand: #{@player2.hand.cards_array}"
      toggle = player_arr[counter % 2]
      
      betting = true
      while betting
        betting, raised = parse_input(player_arr[toggle].get_bet)
      end
      
      @player1.get_recycle_cards
      @player2.get_recycle_cards
      
      betting = true
      while betting
        
        
      end
      
      p "AAAAA"
      gets.chomp
    end
  end
  
  def parse_input(arg, bet_size)
    if arg == r
      
    elsif arg == c
      
    else
      @pot += bet_size
    end
  end
end

a = Game.new
a.play_game
