class User < ActiveRecord::Base
	 has_many :statuses
	 has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#devise :invitable,:database_authenticatable
end
