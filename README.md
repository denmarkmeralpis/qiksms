[![Build Status](https://travis-ci.org/denmarkmeralpis/qiksms.svg?branch=master)](https://travis-ci.org/denmarkmeralpis/qiksms) [![Test Coverage](https://api.codeclimate.com/v1/badges/ea4b451049d8a6ac530b/test_coverage)](https://codeclimate.com/github/denmarkmeralpis/qiksms/test_coverage) [![Maintainability](https://api.codeclimate.com/v1/badges/ea4b451049d8a6ac530b/maintainability)](https://codeclimate.com/github/denmarkmeralpis/qiksms/maintainability) [![Gem Version](https://badge.fury.io/rb/qiksms.svg)](https://badge.fury.io/rb/qiksms)
# Qiksms

This ruby plugin will easily help you send SMS using qiksms API. You can contact qiksms to enable your Developers API console.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qiksms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiksms

Then generate initializer:

    $ rails g qiksms:install
    
then edit the file in `config/initializer/qiksms.rb` and supply the necessary details.

## Usage

Send SMS:
```ruby
client = Qiksms::Client.new(recipient: '917XXXXXXX', message: 'Your awesome message!')
client.send
```
or simply:
```ruby
Qiksms::Client.send(recipient: '917XXXXXXX', message: 'Your awesome message!')
```

You can also change the `sender_id` and `char_type` on the fly:
```ruby
Qiksms::Client.send(recipient: '917XXXXXXX', message: 'Your awesome message!', char_type: '8', sender_id: 'custom')
```

NOTE: Changing of `sender_id` requires approval/subscription from https://wwww.qiksms.com

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/denmarkmeralpis/qiksms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Qiksms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/denmarkmeralpis/qiksms/blob/master/CODE_OF_CONDUCT.md).
