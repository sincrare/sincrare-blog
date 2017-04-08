class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :authority_id
      t.string :mail_address
      t.string :password
      t.text :memo

      t.timestamps
    end
  end
end
