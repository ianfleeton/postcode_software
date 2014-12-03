require 'postcode_software/response'

module PostcodeSoftware
  # Looks up the given +postcode+ and returns found addresses in a
  # <tt>PostcodeSoftware::Response</tt>.
  def self.look_up(postcode)
    Response.new
  end
end
