class AddUserIdToDrugs < ActiveRecord::Migration[5.1]
  def change
    add_column :drugs, :user_id, :integer
  end
end
