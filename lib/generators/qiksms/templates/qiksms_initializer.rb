Qiksms.configure do |config|]
   # Get it from qiksms.com
   config.api_key = ENV['QIKSMS_API_KEY']
   
   # Get it from qiksms.com
   config.api_secret = ENV['QIKSMS_API_SECRET']
   
   # This will be the name of the sender
   # If you want to change this, contact Qiksms
   config.sender_id = 'websms'

   # When using the Unicode message, the message length becomes 70 chars max per message.
   # char_type 0 is not unicode
   # char_type 8 is unicode message
   config.char_type = '0'
end