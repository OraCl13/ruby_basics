# frozen_string_literal: true

require_relative 'train'

class PassengerTrain < Train
  def initialize(num)
    super
    @type = :passenger
  end
end
