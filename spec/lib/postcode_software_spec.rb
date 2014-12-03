require 'spec_helper'
require 'postcode_software'

RSpec.describe PostcodeSoftware do
  describe '.look_up' do
    context 'with username and password unset' do
      it 'works for example LS18 postcodes' do
        expect(PostcodeSoftware.look_up('LS18 4AA')).to be_kind_of(PostcodeSoftware::Response)
      end
    end
  end
end
