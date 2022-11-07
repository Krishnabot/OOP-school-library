require './person'

class Teacher < Person
  def initialize(*all , specialization)
    super(*all)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
