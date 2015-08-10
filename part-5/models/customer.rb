class Customer

  attr_accessor :first_name, :last_name
  attr_reader :orders, :shipping_addresses

  def initialize(args = {})
    @first_name = args.fetch(:first_name)
    @last_name = args.fetch(:last_name)
    @orders = []
    @shipping_addresses = []
  end

  def add_order(order)
    orders << order
  end

  def add_shipping_address(shipping_address)
    shipping_addresses << shipping_address
  end

end
