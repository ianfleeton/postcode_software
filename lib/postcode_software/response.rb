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

    # Street name of the postcode.
    def address_1
      try_content '//Address//Address1'
    end

    # Locality of the postcode or dependent street name if exists.
    def address_2
      try_content '//Address//Address2'
    end

    # Dependent Locality of the postcode.
    def address_3
      try_content '//Address//Address3'
    end

    # Double Dependent Locality of the postcode.
    def address_4
      try_content '//Address//Address4'
    end

    # Town of the postcode.
    def town
      try_content '//Address//Town'
    end

    # County of the postcode.
    def county
      try_content '//Address//County'
    end

    private

    def try_content(path)
      @doc.at_xpath(path).content if @doc.at_xpath(path)
    end
  end
end
