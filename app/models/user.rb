class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :tasks
  has_many :tasks_assigned_to_me, :class_name => 'Task', :foreign_key => :assignee

  def full_name
    "#{first_name} #{last_name}"
  end

end
