# fluent-plugin-chatter-admin

Fluentd input plugin for chatter admin.

## Installation

Add this line to your application's Gemfile:

    gem 'fluent-plugin-chatter-admin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-chatter-admin

## Usage

1. Use chatter importer (see ext directory).
2. Put chatter sqlite db to db directory.
3. This plugin will load the data from sqlite db.

### Fluentd config

    <source>
      type chatter-admin
    </source>

### Output example

    <match chatter.chatter>
      type sqlite3
      path chatter.db
    </match>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Changes

### 0.0.1

* Initial release.
