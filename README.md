# RunnerRoulette

Application that takes a list of runner, inserts them in to a Roulette Table and provides roulette style derivative markets.

## Installation

Add this line to your application's Gemfile:

    gem 'runner_roulette', git: "https://github.com/rudedoc/runner_roulette"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install runner_roulette, git: "https://github.com/rudedoc/runner_roulette"

## Usage

    $ runners = Array of objects that respond to #name and #price_decimal
    $ @table = RunnerRoulette::Table.new(runners)
    $ @table.red_runners_price
    $ @table.black_runners_price

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
