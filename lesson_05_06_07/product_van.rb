# frozen_string_literal: true

require_relative 'van'

class ProductVan < Van
  attr_reader :type, :reserved_v, :in_access_v

  def initialize(volume)
    super
    @type = :product
    @in_access_v = volume
    @reserved_v = 0
  end

  def reserve_volume(volume_to_take)
    return puts 'We dont have enough space' if @in_access_v < volume_to_take

    @in_access_v -= volume_to_take
    @reserved_v += volume_to_take
  end
end
