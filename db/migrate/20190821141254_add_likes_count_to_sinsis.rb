class AddLikesCountToSinsis < ActiveRecord::Migration[5.2]
  def change
    add_column :sinsis, :likes_count, :integer
  end
end
