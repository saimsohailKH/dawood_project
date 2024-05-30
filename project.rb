class User
  attr_accessor :name, :id, :email, :ph_no, :address

  def initialize(name,id,email,ph_no,address)
    @name    = name
    @id      = id
    @email   = email
    @ph_no   = ph_no
    @address = address
  end
end

class Customer < User
  attr_accessor :orders

  def initialize(name,id,email,ph_no,address)
    super(name,id,email,ph_no,address)
    @orders = []
  end

  def create_oder(order)
    order.customer_id = self.id
    orders << order
  end
end

class Order
  attr_accessor :id, :customer_id, :order_total_amount, :order_items, :order_status

  def initialize(id, order_items)
    @id           = id
    @customer_id  = nil
    @order_total_amount = 0.0
    @order_items  = order_items
    @order_status = "pending"
  end

  def valid_order_statuses
    ["pending", "completed", "canceled"]
  end

  def order_complete
    order_status = "completed"
  end

  def order_canceled
    order_status = "canceled"
  end

  def calculate_total_amount
    order_items.each do |n|
      n.calculate_order_item_total_amount
      total_amount = total_amount + n.order_item_total_amount
    end
  end
end

class OrderItem
  attr_accessor :id, :item, :quantity, :order_item_total_amount

  def initialize(id,item,quantity)
    @id           = id 
    @item         = item
    @quantity     = quantity
    @order_item_total_amount = order_item_total_amount
  end

  def calculate_order_item_total_amount
    order_item_total_amount = quantity * item.price
  end
end

class Item
  attr_accessor :name, :id, :price

  def initialize(name,id,price)
    @name  = name
    @id    = id 
    @price = price
  end
end

item1 = Item.new("clock", 777, 900)
item2 = Item.new("glass", 999, 300)
item3 = Item.new("table", 555, 1200)

ordered_item1 = OrderItem.new(345,item1,2)
ordered_item2 = OrderItem.new(346,item2,2)
ordered_item3 = OrderItem.new(347,item3,2)

order_saim = Order.new(123,[ordered_item1, ordered_item2, ordered_item3])

customer = Customer.new("Dawood", 003, "dawood@yahoo.com", "03077579019", "st twn")

name = "Dawood".


class DawoodStore
  attr_accessor :item_list

  def initialize
    item1 = Item.new("clock", 777, 900)
    item2 = Item.new("glass", 999, 300)
    item3 = Item.new("table", 555, 1200)
    @item_list = [item1,item2,item3]
  end

  def run
    print "Enter 1 to see list of items: "
    selection = gets.chomp

    if selection == '1'
      puts item_list.map { |item| item.name }
    end
  end
end
