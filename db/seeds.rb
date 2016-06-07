# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Customer 1:
#   First Name: Johny
#   Last Name: Flow

# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis

# Customer 3:
#   First Name: Andrew
#   Last Name: Chung

# Customer 4:
#   First Name: Mike
#   Last Name: Smith

customer1 = Customer.create(first_name: "Johny", last_name: "Flow")
customer2 = Customer.create(first_name: "Raj", last_name: "Jamnis")
customer3 = Customer.create(first_name: "Andrew", last_name: "Chung")
customer4 = Customer.create(first_name: "Mike", last_name: "Smith")

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
#   - 3 Should be linked to Customer 2
#   - 1 Should be linked to Customer 3
#   - 1 Should be linked to Customer 4

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
#   - 2 Should be linked to Customer 4

# 5 should be disputed:
#   - 3 should be linked to Customer 1
#   - 2 should be linked to customer 2

# Customer 1 => successful: 5, disputed: 3
customer1.charges.create(amount: 4900, currency: "usd", state: 2)
customer1.charges.create(amount: 5900, currency: "usd", state: 2)
customer1.charges.create(amount: 6900, currency: "usd", state: 2)
customer1.charges.create(amount: 7900, currency: "usd", state: 2)
customer1.charges.create(amount: 8900, currency: "usd", state: 2)

customer1.charges.create(amount: 14900, currency: "usd", state: 1)
customer1.charges.create(amount: 15900, currency: "usd", state: 1)
customer1.charges.create(amount: 16900, currency: "usd", state: 1)
# Customer 2 => successful: 3, disputed: 2
customer2.charges.create(amount: 4900, currency: "usd", state: 2)
customer2.charges.create(amount: 5900, currency: "usd", state: 2)
customer2.charges.create(amount: 6900, currency: "usd", state: 2)

customer2.charges.create(amount: 7900, currency: "usd", state: 1)
customer2.charges.create(amount: 8900, currency: "usd", state: 1)
# Customer 3 => successful: 1, failed: 3
customer3.charges.create(amount: 17900, currency: "usd", state: 2)

customer3.charges.create(amount: 18900, currency: "usd", state: 0)
customer3.charges.create(amount: 19900, currency: "usd", state: 0)
customer3.charges.create(amount: 28900, currency: "usd", state: 0)
# Customer 4 => successful: 1, failed: 2
customer4.charges.create(amount: 1900, currency: "usd", state: 2)

customer4.charges.create(amount: 2900, currency: "usd", state: 0)
customer4.charges.create(amount: 3900, currency: "usd", state: 0)