require 'postcode_software/response'

# Provides postcode look up service for postcodesoftware.net
#
#   PostcodeSoftware.username = 'myusername'
#   PostcodeSoftware.password = 'mypassword'
#   response = PostcodeSoftware.look_up('LS18 4AB')
module PostcodeSoftware

  class << self
    # Username for the service
    attr_accessor :username
    # Password for the service
    attr_accessor :password
  end

  # Looks up the given +postcode+ and returns found addresses in a
  # <tt>PostcodeSoftware::Response</tt>.
  def self.look_up(postcode)
    Response.new('')
  end

  # Returns the web SDK URL for the given postcode.
  def self.sdk_url(postcode)
    [
      'http://ws1.postcodesoftware.co.uk/lookup.asmx/getAddress?account=',
      CGI::escape(username),
      '&password=',
      CGI::escape(password),
      '&postcode=',
      CGI.escape(postcode)
    ].join
  end
end
