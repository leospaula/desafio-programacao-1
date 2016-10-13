class OrderService
  
  def initialize(order)
    @order = order
  end
  
  def process(fitem)
    purchaser = Purchaser.find_or_create_by(name: fitem.to_hash[:purchaser_name])
    
    item = Item.find_or_create_by(description: fitem.to_hash[:item_description], 
                                  price: fitem.to_hash[:item_price].to_f)
                                  
    merchant = Merchant.find_or_create_by(name: fitem.to_hash[:merchant_name], 
                                          address: fitem.to_hash[:merchant_address])
                                          
    price = fitem.to_hash[:item_price].to_f * fitem.to_hash[:purchase_count].to_f

    OrderItem.create!(order: @order, purchaser: purchaser, item: item, merchant: merchant, 
                      price: price, quantity: fitem.to_hash[:purchase_count].to_f)

    return price   
  end
end