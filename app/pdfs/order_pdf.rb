class OrderPdf < Prawn::Document
	def initialize(order)
		super()
		@order = order
		order_id
		line_items
		total_price
	end

	def order_id
		text "Order #{@order.id}", style: :bold
	end

	def line_items
		move_down 20
		table line_item_rows do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD", "FFFFFF"]
			self.header = true
		end
	end

	def line_item_rows
		[["Product", "Quantity", "Unit Price", "Full Price"]] +
		@order.line_items.map do |item|
			[item.product.name, item.quantity, item.product.price, item.total_price]
		end
	end

	def total_price
		move_down 20
		text "Total price is #{@order.total_price}"
	end
end