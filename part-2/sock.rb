require_relative 'spec/spec_helper'

class Sock
  attr_reader :brand, :style, :color

  def initialize(args = {})
    @brand = args[:brand]
    @style = args[:style]
    @color = args[:color]
  end

  def match?(sock2)
    self.color == sock2.color && self.style == sock2.style && self.brand == sock2.brand
  end

end
