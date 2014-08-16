# -*- coding: utf-8 -*-
require_relative 'player'
# require 'player'

class Game
  def initialize
    @deck = Deck.new
    @player1 = Player.new(@deck, 12000, "Joe")
    @player2 = Player.new(@deck, 11000, "Jonathan")
    @pot = 0
  end
  
  def play_game
    counter = 0
    player_arr = [@player1,@player2]
    while @player1.bankroll > 0 && @player2.bankroll > 0 
      display_game_state
      toggle = counter % 2 
      
      arg1 = 'z'
      arg2 = 'z'
      bet_size1 = 0
      bet_size2 = 0
      until arg1 == 'c' && arg2 == 'c'
        if toggle == 0
          other = 1
        else
          other = 0
        end
        arg1, bet_size1 = player_arr[toggle].get_action
        arg2, bet_size2 = player_arr[other].get_action
        @pot = @pot + bet_size1.to_i + bet_size2.to_i
      end
      
      #replaces cards in each players' hand
      @player1.get_recycle_cards
      @player2.get_recycle_cards
      
      arg1 = 'z'
      arg2 = 'z'
      bet_size1 = 0
      bet_size2 = 0
      until arg1 == 'c' && arg2 == 'c'
        if toggle == 0
          other = 1
        else
          other = 0
        end
        arg1, bet_size1 = player_arr[toggle].get_action
        arg2, bet_size2 = player_arr[other].get_action
        @pot = @pot + bet_size1.to_i + bet_size2.to_i
      end
      
      assign_pot
      
      display_game_state
      p @player1
      p @player2
      # gets.chomp
    end
  end
  
  def bet_sequence
    
  end
  
  def assign_pot
    p "made it"
    p @player1.hand.current_hand_value[0]
    p @player2.hand.current_hand_value[0]
    if @player1.hand.current_hand_value[0] > @player2.hand.current_hand_value[0]
      @player1.give_amount(@pot)
    elsif @player2.hand.current_hand_value[0] < @player1.hand.current_hand_value[0]
      @player2.give_amount(@pot)
    elsif @player1.hand.current_hand_value[1] > @player2.hand.current_hand_value[1]
      @player1.give_amount(@pot)
    elsif @player1.hand.current_hand_value[1] < @player2.hand.current_hand_value[1]
      @player2.give_amount(@pot)
    else
      half = @pot / 2
      @player1.bankroll += half
      @player2.bankroll += half
    end
  end
  
  def display_game_state
    p "player1 hand: #{@player1.hand.cards_array}, player2 hand: #{@player2.hand.cards_array}, pot: #{@pot}"
  end
  
  # def parse_input(arg, bet_size)
  #   if arg == r
  #
  #   elsif arg == c
  #
  #   else
  #     @pot += bet_size
  #   end
  # end
end

a = Game.new
a.play_game
