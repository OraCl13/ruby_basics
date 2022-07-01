# frozen_string_literal: true

require_relative 'van'

class PassengerVan < Van
  attr_reader :type, :taken_pl, :free_pl

  def initialize(number_places)
    super
    @type = :passenger
    @free_pl = number_places
    @taken_pl = 0
  end

  def take_place
    return puts 'All places are taken' if @free_pl.zero?

    @taken_pl += 1
    @free_pl -= 1
  end
end
