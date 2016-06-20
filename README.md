# Profiler

This is a gem to process a specific CSV file and generate a report about an phone number informed by user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'profiler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install profiler

## Usage

Execute the folling code :

    $ profile 'sample_file.csv' '048-8824-2010'

Where the parameter `sample_file.csv` is the path of csv file and `048-8824-2010` is the phone number that you want to generate the report.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/possebom/profiler.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
