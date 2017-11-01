class AddColumnSecretCodeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secret_code_id, :integer
  end
end
