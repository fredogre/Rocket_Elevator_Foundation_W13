Twilio.configure do |config|
    config.account_sid = ENV["Twilio_Account_Sid"]
    config.auth_token = ENV["Twilio_Auth_Token"]
end 
# export TWILIO_ACCOUNT_SID=ACa8fed497d748d40b82eac3eafc083209

