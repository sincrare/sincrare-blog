class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.text :content
      t.integer :entry_user_id

      t.timestamps
    end
  end
end
