class AddUserIdColumnToPosts < ActiveRecord::Migration[7.1]
  def up
    add_column :posts, :user_id, :int
  end

  def down
    remove_column :posts, :user_id
  end
end
