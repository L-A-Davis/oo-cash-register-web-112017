class CashRegister
  attr_writer :discount, :total, :items
  attr_reader :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    @last_item = item
    @last_price = price
    self.total = self.total + (price * quantity)
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    self.total = self.total - (self.total * (discount/100.0))
    if discount > 0
      "After the discount, the total comes to $%g." % self.total
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_price
    @items.delete(@last_item)
  end
end
