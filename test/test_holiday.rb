require 'minitest/spec'
require 'minitest_helper'

class TestHoliday < MiniTest::Unit::TestCase
  describe "equinox" do
    it "returns vernal and autumn equinox" do
      equinox(2014).must_equal [21, 23]
    end
  end

  describe "holiday" do
    it "is true on saturdays and sundays" do 
      holiday?(2014, 2, 1).must_equal true
      holiday?(2014, 3, 2).must_equal true
    end

    it "is true on [2,11],[4,29],[5,3..5],[11,3],[11,23],[12,23]" do
      holiday?(2014,5,4).must_equal true
      holiday?(2014,12,23).must_equal true
    end

    it "is true on [2,12],[4,30],[11,4],[11,24],[12,24] if monday" do
      holiday?(2014,11,24).must_equal true
    end

    it "is true on [5,6] if t.wday < 4" do
      holiday?(2014,5,6).must_equal true
    end

    it "is true on vernal and autumn equinox" do
      holiday?(2014, 3, 21).must_equal true
      holiday?(2014, 9, 23).must_equal true
    end

    it "is true on monday if equinox day is sunday" do 
      holiday?(2010,3,22).must_equal true
    end

    it "is true on [1,2],[7,3],[9,3],[10,2] mondays" do
      holiday?(2014,1,13).must_equal true
      holiday?(2014,7,21).must_equal true
    end

    it "is true on [1,3]" do
      holiday?(2014,1,3).must_equal true
    end

    it "is false otherwise" do
      holiday?(2014,3,20).wont_equal true
      holiday?(2014,4,28).wont_equal true
    end
  end
end
