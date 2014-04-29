class Task < ActiveRecord::Base

  belongs_to :user

  belongs_to :project

  #belongs_to :project, :class_name => 'Project', :foreign_key => :project_name

  belongs_to :doer, :class_name => 'User' , :foreign_key => :assignee


  #scope :click, lambda{|query|
   # where(["project_id LIKE ?", "#{query}%"])
  #}

end
