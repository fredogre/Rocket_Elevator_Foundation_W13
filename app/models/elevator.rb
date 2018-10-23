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
    ['Intervention', 'Active', 'Inactive']
  end

  def send_message(phone_number, alert_message)

    twilio_accout_sid = 'AC23f8d78c79c30f08afa7887d240cc2df'
    twilio_auth_token = 'a9842b28a247605bb591d56e83bbcdb6'
    @twilio_number = '+15818802402'
    @client = Twilio::REST::Client.new twilio_accout_sid, twilio_auth_token
    
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
      puts "new value #{self.status}"
      new_status = self.status
      #old_status = Elevator.find(self.id).status
      #puts "old value #{old_status}"
        if new_status == "Intervention" 
          send_message("+14185209271", "The Elevator #{self.id} is now in intervention, please take action.")
            # message = "The Elevator #{elevator.id} with serial number #{elevator.serial_number} changed status from #{old_status} to #{new_status}"
        
        end 
       #send_to_slack("salut")
      
    end

end
