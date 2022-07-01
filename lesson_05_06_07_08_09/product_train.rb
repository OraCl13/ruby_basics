# frozen_string_literal: true

require_relative 'train'

class ProductTrain < Train
  def initialize(num)
    super
    @type = :product
  end
end
