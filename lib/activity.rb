class Activity
  attr_reader :name,
              :participants,
              :cost

  def initialize(name, cost)
    @name = name
    @participants = {}
    @cost = cost
  end

  def add_participant(name, paid_amount)
    @participants[name] = paid_amount
  end

  def calulate_owed
    cost_per_person = @cost / @participants.length
    owded_per_person = {}
    @participants.each do |participant, paid|
      owded_per_person[participant] = cost_per_person - paid
    end
    owded_per_person
  end



end
