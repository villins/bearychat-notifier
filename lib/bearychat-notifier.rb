# coding: utf-8
require 'net/http'
require 'uri'
require 'json'
require 'bearychat-notifier/http_client'

module Bearychat
  class Notifier
    attr_reader :webhook_url, :payload

    def initialize(webhook_url, options)
      @webhook_url = webhook_url
      @payload     = options
    end

    def ping(options)
      payload = payload.merge(options)
      params = { payload: payload.to_json }
      HttpClient.post(webhook_url, payload)
    end

    def channel
      payload[:channel]
    end

    def channel=(channel)
      payload[:channel] = channel
    end
  end
end
