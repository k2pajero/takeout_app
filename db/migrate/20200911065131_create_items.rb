class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # t.references :user,             null: false,  foreign_key: true
      t.string     :name,              null: false
      t.text       :description,       null: false
      t.integer    :price,             null: false
      t.integer    :genre_category_id, null: false
      t.integer    :saize_category_id, null: false
      t.string     :unit,              null: false, default: 'yen'
      t.timestamps
    end
  end
end
