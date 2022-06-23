require_relative 'Van'

class PassengerVan < Van
  attr_reader :type

  def initialize
    super
    @type = :passenger
  end
end
