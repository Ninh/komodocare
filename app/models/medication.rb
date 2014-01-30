class Medication < ActiveRecord::Base
  attr_accessible :user_id, :dosage, :description
  belongs_to :user
end
