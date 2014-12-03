require 'spec_helper'
require 'postcode_software'

RSpec.describe PostcodeSoftware do
  describe '.look_up' do
    subject { PostcodeSoftware.look_up(postcode) }

    context 'with username and password unset' do
      context 'using example LS18 postcodes' do
        let(:postcode) { 'LS18 4AA' }

        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }
      end
    end

    context 'with valid username and password' do
      before do
        PostcodeSoftware.username = 'valid'
        PostcodeSoftware.password = 'valid'
      end

      context 'using example LS18 postcodes' do
        let(:postcode) { 'LS18 4AA' }

        it { is_expected.to be_kind_of(PostcodeSoftware::Response) }
      end
    end
  end
end
