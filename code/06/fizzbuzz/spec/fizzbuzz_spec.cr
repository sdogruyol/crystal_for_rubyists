require "./spec_helper"

describe Fizzbuzz do
  it "shouldn't divide 1 by 3" do
    div_by_three(1).should eq(false)
  end

  it "should divide 3 by 3" do
    div_by_three(3).should eq(true)
  end

  it "shouldn't divide 8 by 5" do
    div_by_five(8).should eq(false)
  end

  it "should divide 5 by 5" do
    div_by_five(5).should eq(true)
  end

  it "shouldn't divide 13 by 15" do
    div_by_fifteen(13).should eq(false)
  end

  it "should divide 15 by 15" do
    div_by_fifteen(15).should eq(true)
  end
end
