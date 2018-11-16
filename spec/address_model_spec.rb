require "rails_helper"

RSpec.describe Address, type: :model do

    describe "title" do

        specify "Should display the correct address fields" do

            params = {
                address_type: "Billing",
                status: "Active",
                entity: "",
                street: "777 Brockton Avenue",
                suite: "",
                city: "Avon",
                postalcode: "G2N1J6",
                country: "United State",
                notes: "",
                created_at: '2018-01-23 07:17:33',
                updated_at: '2018-10-24 19:39:54',
                state: "CA"
            }

            address = Address.create(params)

            new_address = "#{address.street} #{address.suite}, #{address.city}, #{address.postalcode}, #{address.country}"

            expect(address.street).to eq("777 Brockton Avenue")
            expect(address.suite).to eq("")
            expect(address.city).to eq("Avon")
            expect(address.postalcode).to eq("G2N1J6")
            expect(address.country).to eq("United State")
           
        end
    end
end