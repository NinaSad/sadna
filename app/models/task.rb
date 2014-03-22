class Task < ActiveRecord::Base
  belongs_to :user

  #scope :click, lambda{|query|
   # where(["project_id LIKE ?", "#{query}%"])
  #}
end
