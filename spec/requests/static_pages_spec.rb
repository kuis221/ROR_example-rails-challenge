require 'spec_helper'

describe 'Static Pages' do

  subject { page }

  describe "Home Page" do
    let(:customer1) { FactoryGirl.create(:customer, first_name: "Johny", last_name: "Flow") }
    let(:customer2) { FactoryGirl.create(:customer, first_name: "Raj", last_name: "Jamnis") }
    let(:customer3) { FactoryGirl.create(:customer, first_name: "Andrew", last_name: "Chung") }
    let(:customer4) { FactoryGirl.create(:customer, first_name: "Mike", last_name: "Smith") }

    before do
      # Customer 1 => successful: 5, disputed: 3
      FactoryGirl.create(:charge, customer: customer1, amount: 4900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer1, amount: 5900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer1, amount: 6900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer1, amount: 7900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer1, amount: 8900, currency: "usd", state: 2)

      FactoryGirl.create(:charge, customer: customer1, amount: 14900, currency: "usd", state: 1)
      FactoryGirl.create(:charge, customer: customer1, amount: 15900, currency: "usd", state: 1)
      FactoryGirl.create(:charge, customer: customer1, amount: 16900, currency: "usd", state: 1)

      # Customer 2 => successful: 3, disputed: 2
      FactoryGirl.create(:charge, customer: customer2, amount: 4900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer2, amount: 5900, currency: "usd", state: 2)
      FactoryGirl.create(:charge, customer: customer2, amount: 6900, currency: "usd", state: 2)

      FactoryGirl.create(:charge, customer: customer2, amount: 7900, currency: "usd", state: 1)
      FactoryGirl.create(:charge, customer: customer2, amount: 8900, currency: "usd", state: 1)

      # Customer 3 => successful: 1, failed: 3
      FactoryGirl.create(:charge, customer: customer3, amount: 17900, currency: "usd", state: 2)

      FactoryGirl.create(:charge, customer: customer3, amount: 18900, currency: "usd", state: 0)
      FactoryGirl.create(:charge, customer: customer3, amount: 19900, currency: "usd", state: 0)
      FactoryGirl.create(:charge, customer: customer3, amount: 28900, currency: "usd", state: 0)

      # Customer 4 => successful: 1, failed: 2
      FactoryGirl.create(:charge, customer: customer4, amount: 1900, currency: "usd", state: 2)

      FactoryGirl.create(:charge, customer: customer4, amount: 2900, currency: "usd", state: 0)
      FactoryGirl.create(:charge, customer: customer4, amount: 3900, currency: "usd", state: 0)
      visit static_pages_home_path
    end

    it { should have_selector('div.failed-charges-section') }
    it { should have_selector('div.disputed-charges-section') }
    it { should have_selector('div.successful-charges-section') }

    describe "Failed charges" do
      it { should have_selector('div.failed-charges-section tbody tr', :count => 5) }
    end

    describe "Disputed charges" do
      it { should have_selector('div.disputed-charges-section tbody tr', :count => 5) }
    end

    describe "Successful charges" do
      it { should have_selector('div.successful-charges-section tbody tr', :count => 10) }
    end
  end
end