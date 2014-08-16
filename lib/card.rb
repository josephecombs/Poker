# -*- coding: utf-8 -*-

class Card
  SUIT_STRINGS = {
      :clubs    => "♣",
      :diamonds => "♦",
      :hearts   => "♥",
      :spades   => "♠"
  }

  VALUE_STRINGS = {
    :two => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  attr_reader :suit, :card_value

  def initialize(suit, card_value)
    @suit = suit
    @card_value = card_value
  end
  
  def to_s
    if VALUE_STRINGS[card_value] < 11
      VALUE_STRINGS[card_value].to_s + SUIT_STRINGS[suit]
    else
      case VALUE_STRINGS[card_value]
      when 11
        "J" + SUIT_STRINGS[suit]
      when 12
        "Q" + SUIT_STRINGS[suit]
      when 13
        "K" + SUIT_STRINGS[suit]
      when 14
        "A" + SUIT_STRINGS[suit]
      end
    end
  end
    
    
end
