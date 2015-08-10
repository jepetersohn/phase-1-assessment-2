class Category

  attr_accessor :name, :description
  attr_reader :products

  def initialize(args = {})
    @name = args.fetch(:name)
    @description = args.fetch(:descriptions)
    @products = []
  end

  def add_product(product)
    products << product
    product.add_category(self)
  end
end
