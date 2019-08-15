class AddUserIdToSinsis < ActiveRecord::Migration[5.2]
  def change
    add_column :sinsis, :user_id, :integer
  end
end
