require 'postcode_software/response'
require 'cgi'
require 'net/http'
require 'uri'
require 'openssl'

# Provides postcode look up service for postcodesoftware.net
#
#   PostcodeSoftware.account  = 'myaccount'
#   PostcodeSoftware.password = 'mypassword'
#   response = PostcodeSoftware.look_up('LS18 4AB')
module PostcodeSoftware

  class << self
    # Account for the service
    attr_accessor :account
    # Password for the service
    attr_accessor :password
  end

  @account  = 'test'
  @password = 'test'

  # Looks up the given +postcode+ and returns found addresses in a
  # <tt>PostcodeSoftware::Response</tt>.
  def self.look_up(postcode)
    uri = URI.parse(sdk_url(postcode))
    response = Net::HTTP.start(
      uri.host,
      uri.port,
      use_ssl: true,
      verify_mode: OpenSSL::SSL::VERIFY_PEER
    ) do |http|
      http.get(uri.request_uri)
    end
    Response.new(response.body)
  end

  # Returns the web SDK URL for the given postcode.
  def self.sdk_url(postcode)
    [
      'https://ws1.postcodesoftware.co.uk/lookup.asmx/getAddress?account=',
      CGI.escape(account.to_s),
      '&password=',
      CGI.escape(password),
      '&postcode=',
      CGI.escape(postcode)
    ].join
  end
end
