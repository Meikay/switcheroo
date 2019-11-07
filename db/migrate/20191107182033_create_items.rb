class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :item_description
      t.integer :user_id
      t.integer :cart_id
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
