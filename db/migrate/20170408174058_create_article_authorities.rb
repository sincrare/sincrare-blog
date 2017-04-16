class CreateArticleAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authorities do |t|
      t.references :article, index: true, foreign_key: true
      t.references :authority, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
