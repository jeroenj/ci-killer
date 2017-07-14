# Ci::Killer

This kills CI instances if they have been running for too long. Currently only [Digital Ocean](https://www.digitalocean.com) instances are supported.

## Installation

```
$ gem install ci-killer
```

## Usage

### Digital Ocean

You'll need to set your access token as an environment variable:

```
DIGITAL_OCEAN_ACCESS_TOKEN = "<token>"
```

Droplets that have been running for longer than the time passed in minutes will be deleted:

```
ci-killer digital_ocean 60
```

This will kill all instances that have been running for 60 minutes or more.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bin/rake install`. To release a new version, update the version number in `version.rb`, and then run `bin/rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jeroenj/ci-killer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
