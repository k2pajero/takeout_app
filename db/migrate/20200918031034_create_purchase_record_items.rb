class CreatePurchaseRecordItems < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_record_items do |t|
      t.references :purchase_record, index: true, null: false, foreign_key: true
      t.references :item, index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
