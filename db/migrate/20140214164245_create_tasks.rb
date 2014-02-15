class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :priority
      t.text :description
      t.string :status
      t.date :due_date
      t.date :creation_date

      t.timestamps
    end
  end
end
