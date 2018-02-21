require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @hiking = Activity.new('hiking')
  end

  def test_create_activity_with_name
    assert_equal 'hiking', @hiking.name
  end

  def test_add_participant
    @hiking.add_participant('joe', 20)
    @hiking.add_participant('mary', 30)

    assert_equal 20, @hiking.participants['joe']
    assert_equal 30, @hiking.participants['mary']
  end
end
