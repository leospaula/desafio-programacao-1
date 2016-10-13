class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :user_id, null: false
      t.string :filename, null: false, default: ""


      t.timestamps null: false
    end
  end
end
