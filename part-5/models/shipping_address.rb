class ShippingAddress

  attr_reader :customer
  attr_accessor :street, :city, :state, :zip_code, :label

  def initialize(args = {})
    @street = args.fetch(:street)
    @city = args.fetch(:city)
    @state = args.fetch(:state)
    @zip_code = args.fetch(:zip_code)
    @label = args.fetch(:label) # home, work, etc

    self.customer = options.fetch(:customer)
  end

  def customer=(customer)
    @customer = customer
    customer.add_shipping_address(self)
  end

end
