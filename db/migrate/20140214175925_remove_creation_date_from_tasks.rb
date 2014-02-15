class RemoveCreationDateFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :creation_date, :date
  end
end
