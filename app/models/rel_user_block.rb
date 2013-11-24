class RelUserBlock < ActiveRecord::Base
 	attr_accessible :block_id, :user_id

  	belongs_to :user, class_name: "User"
	belongs_to :block, class_name: "Block"

	validates :user_id, presence: true
	validates :block_id, presence: true
end
