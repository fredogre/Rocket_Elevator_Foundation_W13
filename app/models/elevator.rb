require 'twilio-ruby'
class Elevator < ApplicationRecord
  belongs_to :column, foreign_key: "column_id"
 
  validate :status_validation

  def model_enum
    ['Standard', 'Premium', 'Excelium']
  end

  def project_type_enum
    ['Residential','Commercial','Corporate','Hybrid']
  end

  def status_enum
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
      # US phone numbers can make use of an image as well.
      # :media_url => image_url 
    )
    puts message.to
  end

  def status_validation
    
    #elev = Elevator.select(:id).where(:column_id => Column.where(:battery_id => Battery.where(:building_id => Building.where(:technician_phone => technician_phone))))
    puts "new value #{self.status}"
    new_status = self.status

      if new_status == 'Intervention'
        send_message("#{self.column.battery.building.technician_phone}", "The Elevator #{self.id} needs attention")
      
      end 
   
    
  end



end
