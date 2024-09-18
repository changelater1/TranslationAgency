class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :title
      t.bigint  :categorable_id
      t.string  :categorable_type
    end
  end
end
