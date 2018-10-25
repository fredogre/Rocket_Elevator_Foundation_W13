require 'twilio-ruby'
<<<<<<< HEAD
class Elevator < ApplicationRecord
  belongs_to :column, foreign_key: "column_id"
 
  validate :status_validation

=======
require 'rest-client'
require 'json'

class Elevator < ApplicationRecord
  belongs_to :column, foreign_key: "column_id"

  validate :status_validation
  

>>>>>>> master
  def model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def project_type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

  def status_enum
<<<<<<< HEAD
    ['Active', 'Intervention', 'Inactive']
  end
  

  def send_message(phone_number, alert_message)

    twilio_account_sid = 'ACa8fed497d748d40b82eac3eafc083209'
    twilio_auth_token = 'de472416f4a48e7df20193778901caf4'
    @twilio_number = '+18193033588'
    @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
    
    message = @client.api.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message,
=======
    ['Intervention', 'Active', 'Inactive']
  end
  
  def send_to_slack(message)
    RestClient.post(
      ENV['SLACK_API_KEY'], 
      {
        payload: {
          channel: "elevator_operations",
          text: "#{message}",
          username: "rocketelevatormanagement",
          icon_emoji: ':heart:'
        }.to_json
      }
    )
  end

  def status_validation
    puts "new value #{self.status}"
    new_status = self.status
    old_status = Elevator.find(self.id).status
    puts "old value #{old_status}"
      if new_status != old_status 
        send_to_slack("The Elevator #{self.id} with serial number #{self.serial_number} changed status from #{old_status} to #{new_status} at #{self.updated_at}")
      end
      if new_status == "Intervention" 
        send_message("#{self.column.battery.building.technician_phone}", "The Elevator #{self.id} in the building number #{self.column.battery.building_id} at #{self.column.battery.building.address.street} is now in need for intervention, please take action.")    
      end 
  end
      

  def send_message(phone_number, alert_message)
    @client = Twilio::REST::Client.new(ENV['twilio_accout_sid'], ENV['twilio_auth_token'])
    @twilio_number = '+15818802402'
  
    message = @client.api.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message
>>>>>>> master
      # US phone numbers can make use of an image as well.
      # :media_url => image_url 
    )
    puts message.to
  end

<<<<<<< HEAD
  def status_validation
    
    #elev = Elevator.select(:id).where(:column_id => Column.where(:battery_id => Battery.where(:building_id => Building.where(:technician_phone => technician_phone))))
    puts "new value #{self.status}"
    new_status = self.status

      if new_status == 'Intervention'
        send_message("#{self.column.battery.building.technician_phone}", "The Elevator #{self.id} needs attention")
      
      end 
   
    
  end



end
=======
end
>>>>>>> master
