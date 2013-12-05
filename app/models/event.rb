class Event < ActiveRecord::Base
  #acts_as_commentable
  attr_accessible :title

  belongs_to :user
 # has_and_belongs_to_many :user

 # has_many :posts, dependent: :destroy
 # has_many :comments, :as => :commentable
  has_many :messages, :as => :commentable, :dependent => :destroy

  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'events.created_at DESC'
  
  #scope :from_users_followed_by, lambda { |user| followed_by(user) }

 # def user
   # @user = User.find([:user_id])
 # end

  def full_title
  	"#{title}"
  end
  
  private
  
    def self.followed_by(user)
     # following_ids = %(SELECT followed_id FROM relationships
      #                  WHERE follower_id = :user_id)
    #  where("user_id IN (#{following_ids}) OR user_id = :user_id",
      #      :user_id => user)
    end
end
