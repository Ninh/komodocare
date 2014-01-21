class Comment < ActiveRecord::Base
  has_ancestry

  attr_accessible :commentable_id, :commentable_type, :content, :user_id

  belongs_to :commentable, :polymorphic => true
  validates :user_id, :presence => true

  belongs_to :user, :polymorphic => true
  accepts_nested_attributes_for :user
end
