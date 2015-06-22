# coding: utf-8
require 'net/http'
require 'uri'
require 'json'
require 'bearychat-notifier/http_client'
require 'exception_notifier/bearychat_notifier'

module Bearychat
  class Notifier
    attr_reader :webhook_url, :payload

    def initialize(webhook_url, options = {})
      @webhook_url = webhook_url
      @payload     = options
    end

    def ping(text, options = {})
      payload.merge!(options)
      payload.merge!(text: text)
      params = { payload: payload.to_json }
      HttpClient.post(webhook_url, params)
    end

    def channel
      payload[:channel]
    end

    def channel=(channel)
      payload[:channel] = channel
    end
  end
end
