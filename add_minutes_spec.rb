require "minitest/autorun"
require "minitest/spec"
require "minitest-matchers"
require "byebug"

require_relative "add_minutes"

describe "add_minutes" do

  describe "invalid base" do
    it "add 0" do
      assert_raises ArgumentError do
        add_minutes(0, 0)
      end
    end
    it "add 0" do
      assert_raises ArgumentError do
        add_minutes('', 0)
      end
    end
    it "add 0" do
      assert_raises ArgumentError do
        add_minutes('aa', 0)
      end
    end
    it "add 0" do
      assert_raises ArgumentError do
        add_minutes('AM', 0)
      end
    end
    it "add 0" do
      assert_raises ArgumentError do
        add_minutes('PM', 0)
      end
    end

  end

  describe "adding 0 minutes to" do
    it "midnight" do
      assert_equal '12:00 AM', add_minutes('12:00 AM', 0)
    end
    it "mid morning" do
      assert_equal '6:00 AM', add_minutes('6:00 AM', 0)
    end
    it "noon" do
      assert_equal '12:00 PM', add_minutes('12:00 PM', 0)
    end
    it "mid afternoon" do
      assert_equal '6:00 PM', add_minutes('6:00 PM', 0)
    end
  end

  describe "adding 30 minutes to" do
    it "midnight" do
      assert_equal '12:30 AM', add_minutes('12:00 AM', 30)
    end
    it "mid morning" do
      assert_equal '6:30 AM', add_minutes('6:00 AM', 30)
    end
    it "noon" do
      assert_equal '12:30 PM', add_minutes('12:00 PM', 30)
    end
    it "mid afternoon" do
      assert_equal '6:30 PM', add_minutes('6:00 PM', 30)
    end
  end

  describe "adding 60 minutes to" do
    it "midnight" do
      assert_equal '1:00 AM', add_minutes('12:00 AM', 60)
    end
    it "mid morning" do
      assert_equal '7:00 AM', add_minutes('6:00 AM', 60)
    end
    it "noon" do
      assert_equal '1:00 PM', add_minutes('12:00 PM', 60)
    end
    it "mid afternoon" do
      assert_equal '7:00 PM', add_minutes('6:00 PM', 60)
    end
  end

  describe "adding 1441 minutes to" do
    it "midnight" do
      assert_equal '12:01 AM', add_minutes('12:00 AM', 1441)
    end
    it "mid morning" do
      assert_equal '6:01 AM', add_minutes('6:00 AM', 1441)
    end
    it "noon" do
      assert_equal '12:01 PM', add_minutes('12:00 PM', 1441)
    end
    it "mid afternoon" do
      assert_equal '6:01 PM', add_minutes('6:00 PM', 1441)
    end
  end

end


