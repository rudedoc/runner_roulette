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
      (100.00 / @price_decimal)
    end

  end

  class Bet

  end

  class Table
    attr_accessor :runners
    attr_reader :horizontal_row_prices
    attr_reader :vertical_row_prices
    attr_reader :red_runners_price
    attr_reader :black_runners_price

    def initialize(runners)
      @runners = runners
      @horizontal_row_prices = horizontal_row_prices
      @vertical_row_prices = vertical_row_prices
      @red_runners_price = red_runners_price
      @black_runners_price = black_runners_price
    end


    ### CALCULATE RED RUNNERS PRICE

    # Get the array of red runners
    def red_runners
      # Start with empty array container
      red_runners_array = []
      # Loop through all the runners in the runner array and their index position in runners array
      @runners.each_with_index do |runner, index|
        # if the runner's index position is an even number add it to the red_runner_array
        if index.even? then red_runners_array << runner end
      end
      # Return the array of red runners
      red_runners_array
    end

    # Calculate the red runners price
    def red_runners_price
      # Start with a total over round of 0
      total_over_round = 0
      # Loop through the array of red runners
      red_runners.each do |runner|
        # Add each runners over_round to the total
        total_over_round += runner.over_round
      end
      # The price is the total_over_round divided by 100
      price = (100 / total_over_round)
      # Round out the decimal to 2 places
      price.round(2)
    end

    ## CALCULATE BLACK RUNNERS PRICES
    # Same as Red Runners - will refactor to remove duplication
    def black_runners
      array = []
      @runners.each_with_index do |runner, index|
        if index.odd? then array << runner end
      end
      array
    end

    def black_runners_price
      total_over_round = 0
      black_runners.each do |runner|
        total_over_round += runner.over_round
      end
      price = (100 / total_over_round)
      price.round(2)
    end

    # Array of Vertical Row Prices
    def vertical_row_prices
      row_prices(vertical_rows)
    end

    # Array of Horizontal Row Prices
    def horizontal_row_prices
      row_prices(horizontal_rows)
    end

    # All possible Horizontal Rows
    def horizontal_rows
      @runners.each_slice(3).to_a
    end

    # All Possible Vertical Rows
    def vertical_rows
      vertical_rows = []
      horizontal_rows[0].count.times do |x|
        vertical_row = []
        horizontal_rows.count.times do |y|
          if horizontal_rows[y][x] != nil
            vertical_row << horizontal_rows[y][x]
          end
        end
        vertical_rows << vertical_row
      end
      vertical_rows
    end

    private

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
