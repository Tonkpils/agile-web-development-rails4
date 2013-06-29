require "spec_helper"

describe OrderNotifier do
  describe "received" do
    let(:mail) { OrderNotifier.received(create(:order)) }

    it "renders the headers" do
      mail.subject.should eq("Pragmatic Store Order Confirmation")
      mail.from.should eq(["depot@example.com"])
    end
  end

  describe "shipped" do
    let(:mail) { OrderNotifier.shipped(create(:order)) }

    it "renders the headers" do
      mail.subject.should eq("Pragmatic Store Order Shipped!")
      mail.from.should eq(["depot@example.com"])
    end
  end

end
