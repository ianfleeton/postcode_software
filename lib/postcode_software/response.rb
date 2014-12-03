require 'nokogiri'

module PostcodeSoftware
  # Groups together addresses and status information returned from the
  # PostcodeSoftware.net web SDK.
  class Response
    # Initialise with the XML returned from the PostcodeSoftware service.
    #
    # The +xml+ parameter can be a filename, string or input stream as
    # compatible with Nokogiri.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      @doc.remove_namespaces!
    end

    # Returns the error number.
    def error_number
      @doc.at_xpath('//Address//ErrorNumber').content.to_i
    end

    # Returns the error message.
    def error_message
      @doc.at_xpath('//Address//ErrorMessage').content
    end
  end
end
