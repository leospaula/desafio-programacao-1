class Order < ApplicationRecord
  has_many :order_item, dependent: :destroy
  
  before_create :set_price

  require 'csv'
  
  def import(file)
    fullprice = 0.0
    if file.nil?
      raise "File is nil!"
    else
      CSV.foreach(file.path, { headers: true, col_sep: "\t", header_converters: :symbol, skip_blanks: true }) do |item|
        fullprice += OrderService.new(self).process(item) 
      end
      self.update(filename: file.original_filename, price: fullprice)
    end
  end

  private
  def set_price
    self.price = 0.0
  end
end
