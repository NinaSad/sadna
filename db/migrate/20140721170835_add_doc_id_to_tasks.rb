class AddDocIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :doc_id, :string
  end
end
