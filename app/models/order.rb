class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  belongs_to :user
  has_many :line_items, dependent: :destroy
  validates :pay_type, inclusion: PAYMENT_TYPES
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.inject(0) { |sum, item| sum + item.total_price }
  end

  STATUS = [
    [ "New", :new ],
    [ "Pending", :pending],
    [ "Approved", :dispatched ],
    [ "Cancelled", :cancelled]
  ]
end
