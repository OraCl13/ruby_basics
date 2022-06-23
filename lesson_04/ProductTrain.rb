
require_relative 'Train'

class ProductTrain < Train
  def initialize(num)
    super
    @type = :product
  end
end