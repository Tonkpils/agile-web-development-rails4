require 'spec_helper'

describe "store/index.html.haml" do
  before(:each) do
    assign(:products, build_stubbed_list(:product, 5))
  end

  it 'renders a list of products' do
    render

    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Great Book'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end
end
