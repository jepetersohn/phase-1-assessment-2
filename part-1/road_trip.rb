class RoadTrip

  attr_accessor :name
  attr_reader :segments

  def initialize(args = {})
    @name = args[:name]
    @segments = args[:segments] || []
    @average_miles = 0
  end

  def add_segment(new_segment)
    @segments << new_segment
  end

  def total_miles
   @average_miles = @segments.inject(0) {|sum, num| sum + num.miles}
  end

  def average_miles_per_segment
    total_miles / @segments.length
  end


end
