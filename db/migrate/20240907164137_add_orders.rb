class AddOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :cost 
      t.datetime :deadline
      t.text :description
      t.string :title
      t.references :user, null: false
    end
  end
end
