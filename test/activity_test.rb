require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @hiking = Activity.new('hiking', 45)
    @hiking.add_participant('joe', 5)
    @hiking.add_participant('mary', 15)
    @hiking.add_participant('todd', 25)
  end

  def test_create_activity
    assert_equal 'hiking', @hiking.name
    assert_equal 45, @hiking.cost
  end

  def test_add_participant
    assert_equal 5, @hiking.participants['joe']
    assert_equal 15, @hiking.participants['mary']
  end

  def test_calculate_owed
    owed = @hiking.calculate_owed
    assert_equal 10, owed['joe']
    assert_equal 0, owed['mary']
    assert_equal (-10), owed['todd']
  end
end
