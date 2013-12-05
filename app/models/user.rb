class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

		has_many :events, dependent: :destroy

		has_many :posts, :through => :events

		has_many :comments, :as => :commentable

has_attached_file :avatar, :styles => { :medium => "180x180#", 
		:thumb => "100x100#" }, 
		:url => "/assets/users/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

	#validates_attachment_presence :avatar
	validates_attachment_size :avatar, :less_than => 5.megabytes
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :avatar, :date_of_birth
  attr_accessor :avatar_file_name, :avatar_file_size, :avatar_content_type

  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true

	before_save { |user| user.email = email.downcase }
	#before_save :destroy_avatar?

	def photo_from_url(url)
		self.photo = open(url)
	end

	def full_email
		"#{email}"
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def registered?(course)
		rel_user_courses.find_by_course_id(course)
	end

	def register!(course)
		rel_user_courses.create!(course_id: course.id)
	end

	def drop!(course)
		rel_user_courses.find_by_course_id(course).destroy
	end

	def friend?(user)
		friendships.find_by_friend_id(user)
	end

	def friend!(user)
		friends.create!(friend_id: user.id)
	end

	def unfriend!(user)
		friends.find_by_followed_id(user).destroy
	end

	private
		def destroy_avatar
			self.avatar.destroy
		end
end
