class CreateAccessHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :access_histories do |t|
      t.integer :user_id
      t.string :ip_address
      t.string :host_name
      t.string :link_source
      t.string :browser

      t.timestamps
    end
  end
end
