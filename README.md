# Bearychat::Notifier

    A simple wrapper for posting to bearychat channels

## Installation

Add this line to your application's Gemfile:

    gem 'bearychat-notifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bearychat-notifier

## Usage
```ruby    
    options = {
      text: "text, this field may accept markdown",
      markdown: true,
      channel: "bearychat-dev",
      attachments: [
        {
            title: "title_1",
            text: "attachment_text",
            color: "#ffffff",
            images: [
                {"url": "http://example.com/index.jpg"}
                ]
        }]
    }

    @notifier = Bearychat::Notifier.new "webhook_url", options

    @notifier.ping "Hello world"
```

## with exception_notification
```ruby
Rails.application.config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[PREFIX] ",
    :sender_address => %{"notifier" <notifier@example.com>},
    :exception_recipients => %w{exceptions@example.com}
  },
  :bearychat => {
    webhook_url: "Your webhook url"
    text: "hello world",
    markdown: true,
    channel: "all",
    attachments: []
  }
```
## With Capistrano3(git)

```
require 'bearychat/capistrano'

set :bearychat_hook, your_bearychat_hook_uri
```

#### options
```
#default: true
set :bearychat_enabled

#default: #E51C23
set :bearychat_failed_color

#default: #259B24
set :bearychat_successed_color

#default: #FFC107
set :bearychat_starting_color
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bearychat-notifier/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
# bearychat-notifier
