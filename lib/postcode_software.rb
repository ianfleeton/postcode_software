require 'postcode_software/result'

module PostcodeSoftware
  # Looks up the given +postcode+ and returns found addresses in a
  # <tt>PostcodeSoftware::Result</tt>.
  def self.look_up(postcode)
    Result.new
  end
end
