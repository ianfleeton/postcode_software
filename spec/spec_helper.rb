require 'webmock/rspec'
require 'support/fake_postcode_software'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /ws1.postcodesoftware.co.uk/).to_rack(FakePostcodeSoftware)
  end
end
