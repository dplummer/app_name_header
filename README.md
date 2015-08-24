# AppNameHeader

Adds the 'X-App-Name' header to your faraday request.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_name_header'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_name_header

## Usage

Where ever you setup your faraday connection, just do:

```ruby
conn.use AppNameHeader::FaradayMiddleware
```

By default the name of your app is your Rails application name. If you'd
like to set it manually, or you're not using Rails, pass the `name` option:

```ruby
conn.use AppNameHeader::FaradayMiddleware, name: 'MoonRover'
```

If you don't care for the header and want to do your own thing, but still use
this gem... I guess you can do that. Weirdo. Just set the `header` option:

```ruby
conn.use AppNameHeader::FaradayMiddleware, header: 'X-Requesty-Guy-Name-Is'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/dplummer/app_name_header.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

