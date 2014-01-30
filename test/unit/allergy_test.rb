require 'test_helper'

class AllergyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Allergy.new.valid?
  end
end
