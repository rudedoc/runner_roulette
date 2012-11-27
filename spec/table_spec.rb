require 'spec_helper'


describe RunnerRoullette::Table do


  runners = []
  1.upto(22) do |runner|
    runners << RunnerRoullette::Runner.new("horse#{runner}", "#{runner}/1", runner+1)
  end

  table = RunnerRoullette::Table.new(runners)

  it "should have runners" do
    table.runners.count.should == 22
  end

  it "should have 8 rows" do
    table.horizontal_rows.count.should == 8
  end

  it "should have 3 columns in each full row" do
    table.horizontal_rows[0..6].each do |row|
      row.count.should == 3
    end
  end

  its "first item should have a price of 1/1" do
    table.horizontal_rows[0][0].price.should == "1/1"
  end

  its "first item should have an over round % of 50%" do
    table.horizontal_rows[0][0].over_round.should == 50.00
  end

  its "3rd item should have an over round of 25%" do
    table.horizontal_rows[0][2].over_round.should == 25.00
  end

  its "1st row bet should have a price_decimal of 1.92" do
    table.horizontal_row_prices[0].should == 1.92
  end

  its "2nd row bet should have a decimal price of 2.96" do
    table.horizontal_row_prices[1].should == 2.96
  end

  its "1st vertial row should have a count of 8 items" do
    table.vertical_rows[0].count.should == 8
  end

  its "2nd vertial row should have a count of 7 items" do
    table.vertical_rows[1].count.should == 7
  end

  its "3rd vertial row should have a count of 7 items" do
    table.vertical_rows[2].count.should == 7
  end

  its "1st vertical row should have a decimal price of 1.92" do
    table.vertical_row_prices[0].should == 1.88
  end

  its "2nd vertical row should have a decimal price of 2.16" do
    table.vertical_row_prices[1].should == 2.16
  end

  its "3nd vertical row should have a decimal price of 2.37" do
    table.vertical_row_prices[2].should == 2.37
  end

  its "number of odd runners objects should be 11" do
    table.red_runners.count.should == 11
  end

  its "odd price should be 1.66" do
    table.red_runners.each do |runner|
      puts runner.inspect
      puts "."
    end
    table.red_runners_price.should == 1.66
  end



end