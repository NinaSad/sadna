class Project < ActiveRecord::Base

  belongs_to :user, :foreign_key => :assignee

  has_many :tasks
  has_many :tasks_project_name_to_me, :class_name => 'Task', :foreign_key => :project_name

  def projectName
    "#{name}"
  end

end
