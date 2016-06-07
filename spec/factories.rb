FactoryGirl.define do
  factory :customer do
    first_name "Johny"
    last_name "Flow"
  end

  factory :charge do
    amount 5900
    currency "usd"
    state 2
    customer
  end
end