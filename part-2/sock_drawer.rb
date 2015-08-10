require_relative 'spec/spec_helper'

class SockDrawer

  attr_reader :socks, :matcher

  def initialize(args = {})
    @socks = args.fetch(:socks) { Array.new }
    @matcher = args.fetch(:matcher) {}
  end

  def supply_match_for(find_sock)
    socks.select do |sock|
      if sock.match?(find_sock)
        @socks.delete(sock)
        return [sock]
      end
    end
    return nil
  end

  def supply_random_pair_of_socks
    pair_socks = []
    @socks.each_with_index do |sock1, index1|
      @socks.each_with_index do |sock2, index2|
        if sock1.match?(sock2) && index1 != index2
          pair_socks << sock2
          pair_socks << sock1
        end
      end
      break if pair_socks.length >= 2
    end
    @socks = @socks - pair_socks
    return pair_socks.reverse #test should be refactored to not test for order of object in the array.
  end

end
