# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'AC23f8d78c79c30f08afa7887d240cc2df'
auth_token = 'a9842b28a247605bb591d56e83bbcdb6'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+15818802402' # Your Twilio number
to = '+14185209271' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "This is a message from Rocket Elevators!"
)