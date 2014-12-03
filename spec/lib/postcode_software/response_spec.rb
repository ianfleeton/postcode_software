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

    context 'without premise level data' do
      let(:xml) { xml_fixture('LS184AF-no-premise.xml') }

      it 'has no premises' do
        expect(subject.premises).to eq []
      end
    end

    context 'with LS18 4AA' do
      let(:xml) { xml_fixture('LS184AA.xml') }

      it 'has address_1 set' do
        expect(response.address_1).to eq 'South Row'
      end

      it 'has address_2 set' do
        expect(response.address_2).to eq 'Horsforth'
      end

      it 'has address_3 unset' do
        expect(response.address_3).to be_nil
      end

      it 'has address_4 unset' do
        expect(response.address_4).to be_nil
      end

      it 'has town set' do
        expect(response.town).to eq 'Leeds'
      end

      it 'has county set' do
        expect(response.county).to eq 'West Yorkshire'
      end

      it 'has postcode set' do
        expect(response.postcode).to eq 'LS18 4AA'
      end

      describe 'premises' do
        subject { response.premises }

        it { expect(subject.length).to eq 4 }

        it 'sets organisation' do
          expect(subject[1][:organisation]).to eq 'Organisation'
        end

        it 'sets building details' do
          expect(subject[2][:building_details]).to eq 'Building Details'
        end

        it 'sets number' do
          expect(subject[0][:number]).to eq '1'
        end
      end
    end

    private

    def xml_fixture(filename)
      File.open(
        File.join [File.dirname(__FILE__), '..', '..', 'support', 'fixtures', filename]
      )
    end
  end
end
