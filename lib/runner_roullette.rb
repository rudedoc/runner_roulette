require "runner_roullette/version"

module RunnerRoullette
  class Runner
    attr_accessor :name, :price, :price_decimal, :over_round

    def initialize(name, price, price_decimal)
      @name = name
      @price = price
      @price_decimal = price_decimal
      @over_round = over_round
    end

    def over_round
      (100.00 / @price_decimal).round(2)
    end

  end

  class Bet
    attr_accessor :id, :runner
  end

  class Table
    attr_accessor :runners, :horizontal_rows, :vertical_rows, :odds, :evens

    def initialize(runners)
      @runners = runners
      @horizontal_rows = horizontal_rows
      @vertical_rows = vertical_rows
    end

    def print
      @rows.each do |row|
        puts row
      end
    end

    def horizontal_rows
      @runners.each_slice(3).to_a
    end

    def horizontal_row_prices
      @rows_prices = []
      @horizontal_rows.each do |row|
        row_over_round = 0.0
        row.each do |item|
          row_over_round += item.over_round
        end
        row_over_round = ((100.0 / row_over_round) +1).round(2)
        @rows_prices << row_over_round
      end
      @rows_prices
    end

    # Needs sorting!
    def vertical_rows
      vertical_rows = []
      @horizontal_rows[0].count.times do |x|
        vertical_row = []
        @horizontal_rows.count.times do |y|
          vertical_row << @horizontal_rows[x-1][y]
        end
        vertical_rows << vertical_row
      end
      vertical_rows
    end

    def vertical_row_prices
      raise "Not Implemented!"
    end
  end

end
