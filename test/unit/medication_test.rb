require 'test_helper'

class MedicationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Medication.new.valid?
  end
end
