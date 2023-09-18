class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.integer :id,          null: false, auto_increment: true
      t.integer :customer_id, null: false
      t.integer :items_id,    null: false
      t.integer :amount
      t.datetime :created_at, default: now
      t.datetime :updated_at, default: now

      t.timestamps
    end
  end
end
