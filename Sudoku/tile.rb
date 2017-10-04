
class Tile
  attr_reader :fixed_value

  def initialize(value)
    @value = to_s(value)
    @fixed_value = (@value != 0)
  end

  def value
    @value
  end

  def change_value(new_value)
    @value = new_value unless @fixed_value
  end

  def to_s(value)
    return value.to_s if value != 0
    return value
  end



end
