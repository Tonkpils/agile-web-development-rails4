require 'spec_helper'

describe Product do

  def new_product(image_url)
    build(:product, image_url: image_url)
  end

  context 'when product attributes are empty' do
    let(:product) { Product.new }

    subject { product.errors }

    before { product.valid? }

    specify { product.should be_invalid }

    its([:title])       { should be_present }
    its([:description]) { should be_present }
    its([:price])       { should be_present }
    its([:image_url])   { should be_present }
  end

  describe '#price' do
    let(:product) { build(:product) }

    context 'with negative price' do
      before do
        product.price = -1
        product.valid?
      end

      it 'is an invalid product' do
        expect(product).to be_invalid
      end
      it 'has a validation error' do
        expect(product.errors[:price]).to eq(['must be greater than or equal to 0.01'])
      end
    end

    context 'with zero price' do
      before do
        product.price = 0
        product.valid?
      end

      it 'is an invalid product' do
        expect(product).to be_invalid
      end
      it 'has a validation error' do
        expect(product.errors[:price]).to eq(['must be greater than or equal to 0.01'])
      end
    end

    context 'with positive price' do
      before do
        product.price = 1
        product.valid?
      end

      it 'is a valid product' do
        expect(product).to be_valid
      end
    end
  end

  describe '#image_url' do
    ok =  %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      it 'is a valid product' do
        expect(new_product(name)).to be_valid
      end
    end

    bad.each do |name|
      it 'is an invalid product' do
        expect(new_product(name)).to be_invalid
      end
    end

  end

  describe '#title' do
    let(:product) { create(:product) }

    context 'when product title is not unique' do
      let(:new_product) { build(:product, title: product.title) }

      before { new_product.valid? }

      it 'is not a valid product without a unique title' do
        expect(new_product).to be_invalid
      end
      it 'has a validation error message' do
        expect(new_product.errors[:title]).to eq([I18n.translate('errors.messages.taken')])
      end
    end
  end
end
