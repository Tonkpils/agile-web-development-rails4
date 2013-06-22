require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, build_stubbed_list(:product, 2))
  end

  it "renders a list of products" do
    render

    assert_select "dt",    :text => "Great Book".to_s, :count => 2
  end
end
