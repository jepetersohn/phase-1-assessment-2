class Product

  attr_reader :categories
  attr_accessor :name, :description

  def initialize(args = {})
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @categories = []
    @orders = []
  end

  def add_category(category)
    categories << category
  end

  def add_order(order)
    orders << order
  end

end
