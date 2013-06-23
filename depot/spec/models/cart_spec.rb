require 'spec_helper'

describe Cart do
  describe '#add_product' do
    let(:cart) { create(:cart) }
    let(:products) { create_list(:product, 5) }
    let(:product) { create(:product) }
    before do
      products.each do |product|
        cart.add_product(product.id, product.price)
      end
    end
    it 'adds a line item to the cart' do
      expect { cart.add_product(product.id, product.price) }.to change(cart.line_items, :count).by(1)
    end
    it 'increases the quantity if item exists' do
      cart.add_product(product.id, product.price)
      item = cart.add_product(product.id, product.price)
      expect(item.quantity).to eq(2)
    end
  end
end
