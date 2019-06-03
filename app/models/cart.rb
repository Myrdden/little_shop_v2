class Cart
  attr_reader :contents
  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def empty?; return @contents.empty? end

  def add(id, quantity)
    if quantity == 0
      @contents.delete(id)
    else
      @contents[id] = quantity
    end
  end

  def quantity
    @contents.values.map(&:to_i).sum
  end

  def quantity_of(id)
    return @contents[id] || 0
  end

  def items
    return Hash[@contents.map {|id,qnt| [Item.find(id), qnt]}]
  end

  def total
    return @contents.sum {|id,qnt| Item.find(id).price * qnt}
  end

  def dollar_off_price(coupon)
    coupon ||= Coupon.find(session[:coupon_id])
    count = @contents.count {|id,qnt| Item.find(id).user_id == coupon.user_id}
    return count == 0 ? coupon.amount : coupon.amount.to_f / count
  end

  def discount_total(coupon)
    dollar_off = self.dollar_off_price(coupon)
    return @contents.sum do |id,qnt|
      item = Item.find(id)
      price = item.price
      if item.user_id == coupon.user_id
        if coupon.percent
          price -= (price / coupon.amount)
        else
          price -= dollar_off 
        end
      end
      return price * quantity
    end
  end
end
