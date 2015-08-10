require_relative 'modules'

class Tent
  attr_reader :capacity
  include Reservable

  def initialize(args = {})
    @capacity = args.fetch(:capacity) { 3 }
  end

end


  # def reserve
  #   @reserved = true
  # end

  # def end_reservation
  #   @reserved = false
  # end

  # def reserved?
  #   @reserved
  # end

  # def available?
  #   !reserved?
  # end

  # def damaged?
  #   @damaged
  # end

  # def record_damage
  #   @damaged = true
  # end

  # def repair
  #   @damaged = false
  # end