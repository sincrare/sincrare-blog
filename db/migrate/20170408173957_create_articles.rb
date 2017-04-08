class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :entry_at
      t.boolean :is_draft
      t.string :og_image

      t.timestamps
    end
  end
end
