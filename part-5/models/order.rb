class Order

  attr_reader :customer, :products
  attr_accessor :shipping_address

  def initialize(args = {})
    @shipping_address = args.fetch(:shipping_address)
    @products = []

    self.customer = args.fetch(:customer)
  end

  def customer=(customer)
    @customer = customer
    customer.add_order(self)
  end

  def add_product(product)
    products << product
    product.add_order(self)
  end

end
