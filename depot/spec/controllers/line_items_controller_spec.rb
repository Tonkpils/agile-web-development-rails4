require 'spec_helper'

describe LineItemsController do

  let(:product) { create(:product) }

  def valid_attributes
    { "product" => "" }
  end

  def valid_session
    {}
  end

  describe "POST create" do

    context "with valid params" do
      it "creates a new LineItem" do
        expect {
          post :create, {:line_item => valid_attributes, product_id: product}, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        post :create, {:line_item => valid_attributes, product_id: product}, valid_session
        assigns(:line_item).should be_a(LineItem)
        assigns(:line_item).should be_persisted
      end

      it "redirects to the created line_item" do
        post :create, {:line_item => valid_attributes, product_id: product}, valid_session
        response.should redirect_to store_path
      end

      context 'with an ajax request' do
        it "creates a new LineItem" do
          expect {
            xhr :post, :create, {:line_item => valid_attributes, product_id: product}, valid_session
          }.to change(LineItem, :count).by(1)
        end
        it 'is a successful request' do
          xhr :post, :create, {line_item: valid_attributes, product_id: product}, valid_session
          response.should be_success
        end
        it 'creates the line item' do
          xhr :post, :create, {line_item: valid_attributes, product_id: product}, valid_session
          assigns(:line_item).should be_a(LineItem)
        end
      end
    end
  end

end
