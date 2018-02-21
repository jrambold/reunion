require './lib/activity'

# reunion with activities
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name, cost)
    @activities << Activity.new(name, cost)
  end

  def total_cost
    @activities.sum { |activity| activity.cost}
  end

  def calculate_owed
    owed = {}
    @activities.each do |activity|
      activity.calculate_owed.each do |person, cost|
        if owed.key?(person)
          owed[person] += cost
        else
          owed[person] = cost
        end
      end
    end
    owed
  end
end
