class Segment

  attr_reader :origin, :destination, :miles

  def initialize(args = {})
    @origin = args[:origin]
    @destination = args[:destination]
    @miles = args[:miles]
  end

    def add_segment(new_segment)
    p new_segment
    @segments << new_segment

  end

end
