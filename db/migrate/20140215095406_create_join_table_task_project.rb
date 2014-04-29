class CreateJoinTableTaskProject < ActiveRecord::Migration
  def change
    create_join_table :tasks, :projects do |t|
      # t.index [:task_id, :project_id]
      # t.index [:project_id, :task_id]
    end
  end
end
