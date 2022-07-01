# frozen_string_literal: true

require_relative 'modules/name_info'
require_relative 'modules/instance_counter'
require_relative 'modules/validate'
require_relative 'modules/my_accessors'

class Train
  include NameInfo
  include InstanceCounter
  # include Validate
  include Validation
  extend Accessors

  attr_reader :current_speed, :current_station, :vans, :num
  attr_accessor :type

  attr_accessor_with_history :a, :b, :c
  # strong_attr_accessor {:non => Train}

  TRAIN_RE = /^[\d|\w]{2,3}-?[\d|\w]{2}$/.freeze

  validate :num, :presence
  validate :num, :format, TRAIN_RE
  validate :attribute_class, :type_obj, Train

  @@trains = []
  def initialize(num)
    @attribute_class = self
    @num = num
    @vans = []
    @current_speed = 0
    @route = nil
    @type = type
    valid?

    @@trains.push(self)
    register_instance
  end

  def self.find(num)
    @@trains.select { |element| element.num == num }
  end

  def vans_in(&block)
    @vans.each do |van|
      block.call(van) # yield
    end
  end

  def speed_up
    @current_speed += 10
  end

  def slow_down
    @current_speed = 0
  end

  def add_van(van)
    return puts 'Stop please to add van' unless @current_speed.zero?

    return puts 'Van and train are not he same type' if van.type != @type

    return puts 'Van is already sticked' if @vans.include? van

    @vans.push(van)
  end

  def remove_van(van)
    return puts 'Stop please to remove van' unless @current_speed.zero?

    return puts 'There no vans' if @vans.empty?

    return puts 'There no such van' unless @vans.include? van

    @vans.delete(van)
  end

  def get_route(route)
    @route = route
    @current_station = @route.list_st[0]
  end

  def move_to_next
    return 'Station do not exists' unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return 'Its already end' unless current_index + 1 < @route.list_st.count

    @route.list_st[current_index].send_train(self)
    @current_station = @route.list_st[current_index + 1]
    @current_station.add_train(self)
  end

  def next_station
    return unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return puts 'It is already final' unless current_index + 1 < @route.list_st.count

    @route.list_st[current_index + 1]
  end

  def previous_station
    return unless @current_station

    current_index = @route.list_st.find_index(@current_station)

    return puts 'It is start' if current_index.zero?

    @route.list_st[current_index - 1]
  end
end
