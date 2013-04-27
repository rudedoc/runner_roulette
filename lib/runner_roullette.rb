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
      (100.00 / @price_decimal)
    end

  end

  class Bet

  end

  class Table
    attr_accessor :runners
    attr_reader :horizontal_row_prices, :vertical_row_prices

    def initialize(runners)
      @runners = runners
      @horizontal_row_prices = horizontal_row_prices
      @vertical_row_prices = vertical_row_prices
    end

    def red_runners
      array = []
      runners.each_with_index do |runner, index|
        if index.even? then array << runner end
      end
      array
    end

    def black_runners
      array = []
      runners.each_with_index do |runner, index|
        if index.odd? then array << runner end
      end
      array
    end

    def red_runners_price
      line_price(red_runners)
    end

    def black_runners_price
      line_price(black_runners)
    end

    def line_price(runners)
      total_over_round = 0
      runners.each do |runner|
        total_over_round += runner.over_round
      end
      price = (100 / total_over_round)
      price.round(2)
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

    def row_prices(rows)
      rows_prices = []
      rows.each do |row|
        row_over_round = 0.0
        row.each do |item|
          row_over_round += item.over_round
        end
        row_over_round = ((100.0 / row_over_round)).round(2)
        rows_prices << row_over_round
      end
      rows_prices
    end
  end

end
