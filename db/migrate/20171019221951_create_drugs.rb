class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :condition
      t.string :subcategory
      t.string :drug

      t.timestamps
    end
  end
end
