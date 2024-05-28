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
  attr_accessor :id, :customer_id, :total_amount, :order_item, :order_status

  def initialize(id, order_items)
    @id           = id
    @customer_id  = nil
    @total_amount = 0.0
    @order_item   = order_item
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
end

class OrderItem
  attr_accessor :id, :item_id, :quantity, :total_amount

  def initialize(id,item_id,quantity,total_amount)
    @id           = id 
    @item_id      = item_id
    @quantity     = quantity
    @total_amount = total_amount
  end

end


order = Order.new(1, [order_item1, order_item2])

customer = Customer.new('dawood', 1, 'email', '0233', 'model town')

customer.create_oder(order)
