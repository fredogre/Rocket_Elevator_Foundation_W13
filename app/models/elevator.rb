require 'rest-client'
require 'json'

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
  
    def send_to_slack(message)
      RestClient.post(
        'https://hooks.slack.com/services/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', 
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
          send_to_slack ("The Elevator #{self.id} with serial number #{self.serial_number} changed status from #{old_status} to #{new_status} at #{self.updated_at}")
          end 
         
        
      end
      

end
  

