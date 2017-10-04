
require "byebug"


# A Card has two useful bits of information:
#  its face value, and whether it is face-up or face-down.
#   You'll want instance variables to keep track of this information.
#   You'll also want a method to display information about the card:
#   nothing when face-down, or its value when face-up. I also wrote
#   #hide, #reveal, #to_s, and #== methods.

# Common problem: Having issues with #hide and #reveal? See here.


class Card

  attr_reader :card_value
  attr_accessor :card_status

  def initialize(card_value, card_status = false)
    @card_value = card_value
    @card_status = card_status

  end

  def hide
    @card_status = false
  end

  def reveal

    return card_value if card_status == true
    return 'x'
  end

  def to_s
  end

  def compare(card2)
    @card_value == card2.card_value
  end




end
