require 'spec_helper'

describe Bearychat::Notifier do
  subject { described_class.new 'http://example.com' }

  describe "#initialize" do
    it "sets the given hook_url to the webhook_url" do
      expect( subject.webhook_url ).to eq 'http://example.com'
    end

    it "sets the defaut options" do
      subject = described_class.new 'http://example.com', channel: 'all'
      expect( subject.channel ).to eq 'all'
    end

    it "#channel=" do
      subject = described_class.new 'http://example.com', channel: 'all'
      subject.channel = "general"
      expect( subject.channel ).to eq 'general'
    end
  end

  describe "#ping" do
    before :each do
      allow( Bearychat::Notifier::HttpClient ).to receive(:post)
    end

    context "with a defaut channel set" do
      before :each do
        subject.channel = "#defaut"
      end

      it "does not require a channel to ping" do
        expect{
          subject.ping "the message"
        }.not_to raise_error
      end

      it "allows override channel to be set" do
        subject.ping "the message", channel: "override"
      end
    end
  end
end
