class AddPasswordDigest < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :password_digest, :string
  end

  def down
    remove_column :users, :password_digest
  end
end
