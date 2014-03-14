class AddUserIdToTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :assignee
    add_column :tasks, :user_id, :integer
    add_index :tasks, :user_id
    add_column :tasks, :assignee, :integer
    add_index :tasks, :assignee
  end
end
