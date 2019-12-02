class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
