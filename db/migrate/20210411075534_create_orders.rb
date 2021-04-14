class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code,                  null: false
      t.integer :area_id,                     null: false
      t.string :municipality,                 null: false
      t.string :adress,                       null: false
      t.string :building_name
      t.string :telephone,                    null: false
      t.references :purchaser,                null: false

      t.timestamps
    end
  end
end
