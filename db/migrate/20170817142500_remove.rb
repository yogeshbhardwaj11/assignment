class Remove < ActiveRecord::Migration
  def change
  	remove_column :users, :secret_code_id
  end
end
