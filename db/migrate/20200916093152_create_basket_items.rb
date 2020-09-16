class CreateBasketItems < ActiveRecord::Migration[6.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, index: true, null: false, foreign_key: true
      t.references :item, index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
