class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
