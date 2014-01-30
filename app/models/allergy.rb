class Allergy < ActiveRecord::Base
  attr_accessible :user_id, :name, :description
  belongs_to :user
end
