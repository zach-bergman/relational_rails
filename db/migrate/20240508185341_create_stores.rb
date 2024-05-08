class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :ongoing_sale
      t.integer :annual_revenue

      t.timestamps
    end
  end
end
