class GildedRose


  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case
      when item.name == "Aged Brie"
        return brie_update(item)
      when item.name == "Sulfuras, Hand of Ragnaros"
        return sulfuras_update(item)
      when item.name == "Conjured"
        return conjured_item_update(item)
      when item.name == "Backstage passes to a TAFKAL80ETC concert"
        return backstage_tickets_update(item)
      else
        return generic_item_update(item)
      end
    end
  end

  def generic_item_update(item)
    if item.quality > 0
      item.quality -= 1
    end
    if item.quality > 0 && item.sell_in <= 0
      item.quality -= 1
    end
    item.sell_in -= 1
  end

  def conjured_item_update(item)
    if item.quality > 0
      item.quality -= 2
    end
    if item.sell_in <= 0
      item.quality -= 2
    end
    item.sell_in -= 1
  end

  def brie_update(item)
    return if item.quality >= 50
      item.quality += 1
    if item.quality < 50 && item.sell_in <= 0
      item.quality += 1
    end
    item.sell_in -= 1
  end

  def sulfuras_update(item)
  end

  def backstage_tickets_update(item)
    if item.quality < 50
      item.quality += 1
    end
    if item.sell_in <= 0
      item.quality -= item.quality
    end
    return if item.quality >= 50
    if item.sell_in < 11 &&  item.sell_in > 5
      item.quality += 1
    end
    if item.sell_in > 0 && item.sell_in < 6
      if item.quality == 49
        item.quality += 1
      elsif item.quality < 50
        item.quality += 2
      end
    end
    item.sell_in -= 1
  end
end
