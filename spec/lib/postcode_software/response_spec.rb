require 'spec_helper'
require 'postcode_software/response'

module PostcodeSoftware
  describe Response do
    let(:xml) do
      <<-xml
      <?xml version="1.0" encoding="utf-8"?>
      <Address xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://postcodesoftware.co.uk/">
      <ErrorNumber>5</ErrorNumber>
      <ErrorMessage>Test accounts can only be used with LS18 postcodes</ErrorMessage>
      </Address>
      xml
    end

    subject(:response) { Response.new(xml) }

    describe '#error_number' do
      subject { response.error_number }

      it { is_expected.to eq 5 }
    end

    describe '#error_message' do
      subject { response.error_message }

      it { is_expected.to eq 'Test accounts can only be used with LS18 postcodes' }
    end
  end
end
