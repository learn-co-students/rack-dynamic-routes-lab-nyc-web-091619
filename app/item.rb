class Item
  attr_accessor :name, :price

  @@item = []
  
  def initialize(name,price)
    @name = name
    @price = price

    @@item << self
  end

  def self.items
    @@item
  end
end
