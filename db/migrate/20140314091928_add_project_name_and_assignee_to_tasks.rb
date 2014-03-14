class AddProjectNameAndAssigneeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_name, :string
    add_column :tasks, :assignee, :string
  end
end
