class AddParamToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :authority_id, :integer
    add_column :users, :comment, :text
  end
end
