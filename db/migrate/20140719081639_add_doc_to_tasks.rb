class AddDocToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :doc, :string
  end
end
