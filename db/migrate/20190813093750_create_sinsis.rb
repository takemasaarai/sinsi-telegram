class CreateSinsis < ActiveRecord::Migration[5.2]
  def change
    create_table :sinsis do |t|
      t.string :title
      t.text :word
      t.string :picture

      t.timestamps
    end
  end
end
