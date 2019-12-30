class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false 
    add_column :users, :year_id, :integer, null: false
    add_column :users, :month_id, :integer, null: false
    add_column :users, :date_id, :integer, null: false
    add_column :users, :phone_number, :string
    add_column :users, :icon, :text
  end
end
