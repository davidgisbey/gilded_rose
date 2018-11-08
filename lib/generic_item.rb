class Generic

attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
  end 

  def generic_item_update
    if item.quality > 0
      item.quality -= 1
    end
    if item.quality > 0 && item.sell_in <= 0
      item.quality -= 1
    end
    item.sell_in -= 1
  end

end
