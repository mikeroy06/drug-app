class AddNotesToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_column :drugs, :notes, :string
  end
end
