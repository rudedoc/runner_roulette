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

    # All possible Horizontal Rows
    def horizontal_rows
      @runners.each_slice(3).to_a
    end

    # All Possible Vertical Rows
    def vertical_rows
      vertical_rows = []
      @horizontal_rows[0].count.times do |x|
        vertical_row = []
        @horizontal_rows.count.times do |y|
          if @horizontal_rows[y][x] != nil
            vertical_row << @horizontal_rows[y][x]
          end
        end
        vertical_rows << vertical_row
      end
      vertical_rows
    end

    # Array of Vertical Row Prices
    def vertical_row_prices
      row_prices(@vertical_rows)
    end

    # Array of Horizontal Row Prices
    def horizontal_row_prices
      row_prices(@horizontal_rows)
    end

    private

    def row_prices(rows)
      rows_prices = []
      rows.each do |row|
        row_over_round = 0.0
        row.each do |item|
          row_over_round += item.over_round
        end
        row_over_round = ((100.0 / row_over_round) +1).round(2)
        rows_prices << row_over_round
      end
      rows_prices
    end
  end

end
