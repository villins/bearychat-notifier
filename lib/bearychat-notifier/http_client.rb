# coding: utf-8
module Bearychat
  class Notifier
    class HttpClient
      class << self
        def post(uri, params)
          HttpClient.new(uri, params).call
        end
      end

      attr_reader :uri, :params, :http_options

      def initialize(url, params) 
        @uri = uri
        @http_options = params.delete(:http_options) || {}
        @params = params
      end

      def call
        http_post
      end

      private
      def http_post
        url = URI.parse(uri)
        post_obj = Net::HTTP.Post.new(url.path)
        post_obj.set_form_data(params)

        socket = Net::HTTP.new(url.host, url.port)
        socket.use_ssl = true if url.scheme.downcase == "https"
        
        http_options.each do |opt, val|
          if http.respond_to? "#{opt}="
            http.send "#{opt}=", val
          else
            warn "Net::HTTP doesn't respond to `#{opt}=`, ignoring that option"
          end
        end

        response = socket.start {|http| http.request(post) }
      end
    end 
  end
end
