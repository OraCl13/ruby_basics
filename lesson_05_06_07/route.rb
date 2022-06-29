# frozen_string_literal: true

class Route
  attr_reader :list_st

  def initialize(start_st, end_st)
    @start_st = start_st
    @end_st = end_st
    @list_st = [start_st, end_st]
  end

  def add_station(station)
    return puts 'There are already such station' if @list_st.include? station

    @list_st.insert(-2, station)
  end

  def remove_station(station)
    return puts 'we cannot do this' if station == @start_st || station == @end_st || !@list_st.include?(station)

    @list_st.delete(station)
  end
end
