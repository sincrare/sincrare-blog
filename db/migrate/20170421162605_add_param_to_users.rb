class AddParamToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :authority_id, :integer, default: 1, null: false
    add_column :users, :comment, :text
  end
end
