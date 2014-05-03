class RemoveProjectNameAndAssigneeFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :Assignee, :string
  end
end
