class Project < ActiveRecord::Base

  has_many :tasks
  has_many :tasks_project_name_to_me, :class_name => 'Task', :foreign_key => :project_name

  def projectName
    "#{name}"
  end

end
