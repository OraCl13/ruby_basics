require_relative 'Van'

class ProductVan < Van
  attr_reader :type

  def initialize
    super
    @type = :product
  end
end
