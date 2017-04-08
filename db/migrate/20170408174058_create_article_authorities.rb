class CreateArticleAuthorities < ActiveRecord::Migration[5.0]
  def change
    create_table :article_authorities do |t|
      t.integer :article_id
      t.integer :authority_id

      t.timestamps
    end
  end
end
