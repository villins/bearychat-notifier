require 'spec_helper'

describe Bearychat::Notifier::HttpClient do
  describe ".post" do
    it "initialize HttpClient with the given uri and params then call" do
      http_post_double = instance_double("Bearychat::Notifier::HttpClient")
      expect( described_class ).to receive(:new)
                               .with('uri', 'params')
                               .and_return( http_post_double )

      expect( http_post_double ).to receive( :call )
      described_class.post 'uri', 'params'
    end
  end

  describe "#initialize" do
    it "setting options HttpClient" do
      http_client = described_class.new('http://example.com/', http_options: { open_timeout: 5 })

      http_client.call
    end
  end
end
