class Message < ActiveRecord::Base
	has_ancestry
	attr_accessible :ancestry, :commentable_id, :commentable_type, :content
	belongs_to :commentable, :polymorphic => true
end
