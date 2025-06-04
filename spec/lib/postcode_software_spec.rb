require 'spec_helper'
require 'postcode_software'

RSpec.describe PostcodeSoftware do
  describe '.look_up' do
    subject { PostcodeSoftware.look_up(postcode) }

    context 'with account and password unset' do
      context 'using example LS18 postcodes' do
        let(:postcode) { 'LS18 4AA' }
        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }

        it 'has error_number of 0' do
          expect(subject.error_number).to eq 0
        end

        it 'has empty error message' do
          expect(subject.error_message).to eq ''
        end
      end

      context 'using example DN1 postcodes' do
        let(:postcode) { 'DN1 2QP' }
        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }

        it 'has error_number of 5' do
          expect(subject.error_number).to eq 5
        end

        it 'has error_message set' do
          expect(subject.error_message).to eq 'Test accounts can only be used with LS18 postcodes'
        end
      end
    end

    context 'with valid account and password' do
      before do
        PostcodeSoftware.account = 'valid'
        PostcodeSoftware.password = 'valid'
      end

      context 'using example LS18 postcodes' do
        let(:postcode) { 'LS18 4AA' }

        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }
      end
    end

    context 'with valid numeric account and valid password' do
      before do
        PostcodeSoftware.account = 12345
        PostcodeSoftware.password = 'valid'
      end

      context 'using example LS18 postcodes' do
        let(:postcode) { 'LS18 4AA' }

        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }
      end
    end

    context 'with invalid account or password' do
      before do
        PostcodeSoftware.account = 'invalid'
      end

      let(:postcode) { 'LS18 4AA' }

      it 'has error_number of 1' do
        expect(subject.error_number).to eq 1
      end

      it 'has error_message set' do
        expect(subject.error_message).to eq 'Account not active'
      end
    end
  end

  describe '.sdk_url' do
    it 'returns the URL containing auth and postcode params' do
      PostcodeSoftware.account = 'u'
      PostcodeSoftware.password = 'p'
      postcode = 'LS18 4AA'
      expected = 'https://ws1.postcodesoftware.co.uk/lookup.asmx/getAddress?account=u&password=p&postcode=LS18+4AA'
      expect(PostcodeSoftware.sdk_url(postcode)).to eq expected
    end
  end
end
