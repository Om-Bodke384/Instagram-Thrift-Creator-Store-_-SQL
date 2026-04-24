customer[icon:customer_url]{
  customer_id int pk
  email_id varchar(50)
  Name varchar(50)
  Password varchar(50)
  verification_token varchar(50)
  customer_address varchar(50)
  created_at timestamp
  updated_at timestamp
}

Product[icon:product_url]{
  product_id int pk
  product_name varchar(50)
  color varchar(50)
  size varchar(50)
  type enum[Handmade,Thrift]
  price decimal(10,2)
  condition text 
  created_at
  updated_at
}

Inventory[icon:inverntory_url]{
  inventory_id int pk
  product_id int fk 
  qunatity int 
}

Orders[icon:order_url]{
  order_id int pk
  customer_id int fk
  total_price decimal
  status enum['pending','processing','shipped','delivered','cancelled']
  created_at timestamp
  updated_at timestamp
}

Order_items[icon:order_item_url]{
  item_id int pk
  order_id int fk
  product_id int fk 
  qunatity int 
  price_at_purchase decimal(10,2)
  created_at timestamp
  updated_at timestamp
}

payment[icon:payment_url]{
  payment_id int pk
  order_id int fk
  payment_method enum['credit_Card','UPI']
  transaction_id varchar(50)
  amount decimal (10,2)
  status enum['pending','completed','failed','refunded']
  paid_at timestamp
}

//product-inventry
Product.product_id < Inventory.product_id
//product-order_items
Product.product_id > Order_items.product_id
//Orders-Order_items
Orders.order_id < Order_items.order_id
//Orders - customer
Orders.customer_id  > customer.customer_id
//Order - payment
Orders.order_id < payment.order_id
