class Post < ActiveRecord::Base
  attr_accessible :content, :date_created

  belongs_to :event

  has_many :comments, :as => :commentable, :dependent => :destroy
end
