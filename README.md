# BrasilfoneAPI

This gem provides a simple ruby API to communicate with Brasilfone's web API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brasilfone_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brasilfone_api


## Configuring

Add your authorized credentials to BrasilfoneAPI:

```ruby
BrasilfoneAPI.configure do |config|
  config.username = 'martianbuddy'
  config.password = '0508'
end
```

Remember that you need to enable the credentials from Brasilfone's dashboard

## Usage

Those are the methods that can be called from the module:

```ruby
BrasilfoneAPI.send_sms('phone_number', 'message text')
BrasilfoneAPI.sms_status('sms_id')
BrasilfoneAPI.balance
BrasilfoneAPI.sms_status_by_date_range('start date', 'end date')
BrasilfoneAPI.reply_status_for_sms('sms_id')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/redealumni/brasilfone_api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

