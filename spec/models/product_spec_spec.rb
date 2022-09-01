require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe 'Validations' do

    it "This is a valid product" do
      @category = Category.create
      @product = Product.new(name: "Rose", price: 35, quantity: 35, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it "This is product is missing a name" do
      @category = Category.create
      @product = Product.new(name: nil, price: 42, quantity: 15, category: @category)
      @product.save
      expect(@product).to_not be_valid
    end

    it "This product is valid when the price is included" do
      @category = Category.create
      @product = Product.new(name: "Bonsai Cotoneaster", price: 55, quantity: 40, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it "This product is valid when the price is not included" do
      @category = Category.create
      @product = Product.new(name: "Moon Cactus", price: nil, quantity: 15, category: @category)
      @product.save
      expect(@product).to_not be_valid
    end


  end
end
