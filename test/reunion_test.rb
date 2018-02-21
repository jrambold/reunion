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

  def test_total_cost
    @reunion.add_activity('hiking', 45)
    @reunion.add_activity('drinking', 150)

    assert_equal 195, @reunion.total_cost
  end

  def test_cost_per_person
    @reunion.add_activity('hiking', 45)
    hiking = @reunion.activities[0]
    hiking.add_participant('joe', 5)
    hiking.add_participant('mary', 15)
    hiking.add_participant('todd', 25)

    @reunion.add_activity('drinking', 150)
    drinking = @reunion.activities[1]
    drinking.add_participant('joe', 70)
    drinking.add_participant('mary', 50)
    drinking.add_participant('todd', 20)

    owed = @reunion.calculate_owed

    assert_equal (-10), owed['joe']
    assert_equal 0, owed['mary']
    assert_equal 20, owed['todd']

    owed.each do |person, cost|
      puts "#{person} owes #{cost} to the reunion"
    end
  end
end
