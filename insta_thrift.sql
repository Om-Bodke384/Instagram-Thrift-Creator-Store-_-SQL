customer [icon: user] {
  customer_id int [pk]
  customer_name varchar(50)
  customer_email varchar(50)
  customer_mobile_no varchar(15)
  customer_address varchar(255) 
}

product [icon: package] {
  product_id int [pk]
  product_name varchar(50)
  color varchar(12)
  size varchar(10)
  price int
  is_thrift boolean
  is_handmade boolean
}

order [icon: shopping-cart] {
  order_id int [pk]
  customer_id int [ref: > customer.customer_id] 
  order_date timestamp
  total_amount int
}

order_items {
  order_item_id int [pk]
  order_id int [ref: > order.order_id]
  product_id int [ref: > product.product_id] // Add this ref
  quantity int
  price int
}

sold_item [icon: check-circle] {
  sold_id int [pk]
  product_id int
  order_id int
  customer_id int
  sale_price int
}

in_stock [icon: archive] {
  product_id int [pk]
  current_quantity int
}

payment [icon: credit-card] {
  payment_id int [pk]
  order_id int
  payment_method varchar 
  transaction_id varchar
  payment_status varchar 
  paid_at timestamp
}


customer.customer_id < order.customer_id

order.order_id < order_items.order_id
product.product_id < order_items.product_id
product.product_id < sold_item.product_id
order.order_id < sold_item.order_id
customer.customer_id < sold_item.customer_id

product.product_id - in_stock.product_id
order.order_id - payment.order_id
