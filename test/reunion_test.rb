require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('corellia')
  end

  def test_reunion_has_location
    assert_equal 'corellia', @reunion.location
  end

  def test_add_activity
    @reunion.add_activity('hiking', 45)
    assert_equal 'hiking', @reunion.activities[0].name
    assert_equal 45, @reunion.activities[0].cost
  end
end
