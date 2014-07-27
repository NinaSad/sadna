class Project < ActiveRecord::Base

  belongs_to :user, :foreign_key => :assignee

  has_many :tasks
  has_many :tasks_project_name_to_me, :class_name => 'Task', :foreign_key => :project_name

  def projectName
    "#{name}"
  end

  def projectProgress
    done = tasks.where(:status=> 'DONE').count
    all = tasks.all.count
    if all == 0
      x = '0%'
    else
      x = "%d%" % ((Float(done)/Float(all))*100)
    end
    return x
  end

end
