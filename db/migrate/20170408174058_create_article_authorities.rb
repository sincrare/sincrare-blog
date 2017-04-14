class CreateArticleAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authorities do |t|
      t.integer :article, index: true, foreign_key: true
      t.integer :authority, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
