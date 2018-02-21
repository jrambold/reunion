class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid_amount)
    @participants[name] = paid_amount
  end

end
