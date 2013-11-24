class Event < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user
  
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'events.created_at DESC'
  
  #scope :from_users_followed_by, lambda { |user| followed_by(user) }

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
