module OrdersHelper
  
  def decrease_link order_product
    link_to "-", order_product_path(order_product, :amount => "#{order_product.amount - 1}"), :method => :put
  end
  
  def increase_link order_product
     link_to "+", order_product_path(order_product, :amount => "#{order_product.amount + 1}"), :method => :put
  end
end
