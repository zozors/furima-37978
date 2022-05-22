class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string  :title,                        null: false
      t.text    :content,                      null: false
      t.integer :category_id,                  null: false
      t.integer :situation,                    null: false
      t.integer :burden_of_shipping_charge_id, null: false
      t.integer :prefecture_id,                null: false
      t.integer :shipping_day_id,              null: false
      t.integer :price,                        null: false
      t.references :user,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
