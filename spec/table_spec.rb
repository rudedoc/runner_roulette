require 'spec_helper'


describe RunnerRoulette::Table do
  before(:all) do
    ## CREATE 22 RUNNERS WITH PRICES FROM 1/1 to to 22/1

    # |1. Runner "1/1"      | 2. Runner "2/1"    | 3. Runner "3/1"    | Row 1 - 1.92
    # |4. Runner "4/1"      | 5. Runner "5/1"    | 6. Runner "6/1"    | Row 2 - 2.96
    # |7. Runner "7/1"      | 8. Runner "8/1"    | 9. Runner "9/1"    | Row 3 -
    # |10. Runner "10/1"    | 11. Runner "11/1"  | 12. Runner "12/1"  |
    # |13. Runner "13/1"    | 14. Runner "14/1"  | 15. Runner "15/1"  |
    # |16. Runner "16/1"    | 14. Runner "17/1"  | 15. Runner "18/1"  |
    # |19. Runner "19/1"    | 20. Runner "20/1"  | 21. Runner "21/1"  |
    # |22. Runner "22/1"    |
    # | Column 1 - 1.88     |   Column 2 - 2.16  |   Column 3 - 2.37  |

    # Red Runners   - 1.66
    # Black Runners - 1.88

    runners = []
    1.upto(22) do |runner|
      runners << RunnerRoulette::Runner.new("horse#{runner}", "#{runner}/1", runner+1)
    end

    @table = RunnerRoulette::Table.new(runners)
  end

  it "should have 22 runners" do
    @table.runners.count.should == 22
  end

  it "should have 8 rows" do
    @table.rows.count.should == 8
  end

  it "should have 3 columns in each full row" do
    @table.rows[0..6].each do |row|
      row.count.should == 3
    end
  end

  its "first square/runner on the table should have a price of 1/1" do
    @table.rows[0][0].price.should == "1/1"
  end

  its "first square/runner on the table should have an over round % of 50%" do
    @table.rows[0][0].over_round.should == 50.00
  end

  its "3rd square/runner on the table should have an over round of 25%" do
    @table.rows[0][2].over_round.should == 25.00
  end

  its "1st row bet should have a price_decimal of 1.92" do
    @table.horizontal_row_prices[0].should == 1.92
  end

  its "2nd row bet should have a decimal price of 2.96" do
    @table.horizontal_row_prices[1].should == 2.96
  end

  its "1st vertical row should have a count of 8 items" do
    @table.columns[0].count.should == 8
  end

  its "2nd vertical row should have a count of 7 items" do
    @table.columns[1].count.should == 7
  end

  its "3rd vertical row should have a count of 7 items" do
    @table.columns[2].count.should == 7
  end

  its "1st Column should have a decimal price of 1.92" do
    @table.vertical_row_prices[0].should == 1.88
  end

  its "2nd Column should have a decimal price of 2.16" do
    @table.vertical_row_prices[1].should == 2.16
  end

  its "3nd Column should have a decimal price of 2.37" do
    @table.vertical_row_prices[2].should == 2.37
  end

  its "red runners price should be 1.66" do
    @table.red_runners_price.should == 1.66
  end

  its "black runners price should be 1.82" do
    @table.black_runners_price.should == 1.82
  end
end