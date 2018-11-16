require "rails_helper"

RSpec.describe Battery, type: :model do

    describe "Battery" do
        specify "is not valid if building or employee id's are not present" do

            params = {
                status: "Active"
            }

            battery = Battery.create(params)

            expect(battery.status).to eq("Active")
            expect(battery.valid?).to eq(false)

        end

        specify "is valid when building and employee id's are present" do

            params = { id: 299, building_id: 497, employee_id: 2 }
            building_params = { id: 497, customer_id: 999, address_id: 500 }
            employee_params = { id: 2, user_id: 38}
            user_params = {email: "test3@tes.com", password: "1236543rr", id: 38}
            address_params = {id: 500}
            customer_params = { id: 999, address_id: 500, user_id: 38}

            address = Address.create!(address_params)
            customer = Customer.create!(customer_params)
            user = User.create!(user_params)
            employee  = Employee.create!(employee_params)
            building = Building.create!(building_params)
            battery = Battery.create!(params)


            expect(battery.building_id).to eq 497
            expect(battery.id).to eq 299
            expect(battery.valid?).to eq true 

        end
    end

end