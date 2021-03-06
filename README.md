[![Build
Status](https://travis-ci.org/jamesmacwilliam/active_record_uniqueness_via_db.svg?branch=master)](https://travis-ci.org/jamesmacwilliam/active_record_uniqueness_via_db)

[![Code
Climate](https://codeclimate.com/github/jamesmacwilliam/active_record_uniqueness_via_db/badges/gpa.svg)](https://codeclimate.com/github/jamesmacwilliam/active_record_uniqueness_via_db)

# ActiveRecordUniquenessViaDb

This simplifies validations by uniqueness using db constraints.  Rails
uniqueness validations are not safe for concurrent processes, so we need
to add a db constraint anyway to ensure values are unique in the
database.  This allows us to just rely on the error that constraint
raises rather than perform an extra select statement prior to
insert/updates

```
validate :some_key, uniqueness: { via: :db }
```

the rails uniqueness validation already accepts options rather than a
simple truthy value, this gem adds the `:via` key to those options

-supported adapters: `mysql2`, `postgresql`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_uniqueness_via_db'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_uniqueness_via_db

Notes:
- if you are upgrading from VERSION <= v0.1.1, remove the
  initializers
- if you use the `composite_primary_keys` gem, ensure that
  `gem 'active_record_uniqueness_via_db'` is
  included **after** the reference for `composite_primary_keys`.  (This is
  necessary because `composite_primary_keys` rather than extending the
  uniqueness validation overwrites it, in contrast, this gem just extends
  the functionality so they play nice together as long as this gem comes
  after that one).

## Usage

```
validate :some_key, uniqueness: { via: :db }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Note: to add databases, add a file under `lib/adapters/db_adapter_name.rb`
that implements the `error_matches_att` method
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jamesmacwilliam/active_record_uniqueness_via_db. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

