class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string     :postal_code, default: '', null: false
      t.integer    :prefecture_id,              null: false
      t.string     :city,          default: '', null: false
      t.string     :address,       default: '', null: false
      t.string     :building_name, default: ''
      t.string     :tell,          default: '', null: false
      t.timestamps
    end
  end
end
