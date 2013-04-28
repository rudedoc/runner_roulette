require "runner_roullette/version"

module RunnerRoullette
  class Runner
    attr_accessor :name, :price, :price_decimal

    def initialize(name, price, price_decimal)
      @name = name
      @price = price
      @price_decimal = price_decimal
    end

    def over_round
      (100.00 / price_decimal)
    end
  end

  class Table
    attr_accessor :runners

    def initialize(runners)
      @runners = runners
    end

    public

    def red_runners_price
      line_price(red_runners)
    end

    def black_runners_price
      line_price(black_runners)
    end

    def vertical_row_prices
      row_prices(columns)
      # each column - gen a price and store it in array
    end

    def horizontal_row_prices
      row_prices(rows)
    end

    def rows
      runners.each_slice(3).to_a
    end

    # TODO: Code Smell - Refactor Complex/Long Method
    def columns
      columns = []
      rows[0].count.times do |x|
        column = []
        rows.count.times do |y|
          if rows[y][x] != nil
            column << rows[y][x]
          end
        end
        columns << column
      end
      columns
    end

    protected

    # TODO: remove Duplication
    def red_runners
      array = []
      runners.each_with_index do |runner, index|
        array << runner if index.even?
      end
      array
    end

    # TODO: remove Duplication
    def black_runners
      array = []
      runners.each_with_index do |runner, index|
        array << runner if index.odd?
      end
      array
    end

    def row_prices(rows)
      rows.collect { |row| line_price(row) }
    end

    def line_price(runners)
      total_over_round = runners.inject(0) { |sum, runner| sum + runner.over_round }
      price = (100 / total_over_round) + 1
      price.round(2)
    end

  end

end
