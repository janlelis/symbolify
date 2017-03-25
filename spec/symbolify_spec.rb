require_relative "../lib/symbolify"
require "minitest/autorun"

describe Symbolify do
  describe ".symbolify" do
    it "will show replacement character for invalid characters" do
      assert_equal "�", Symbolify.symbolify("\x80")
    end
  end

  describe ".unicode" do
    it "works with normal characters" do
      assert_equal "A", Symbolify.symbolify("A")
      assert_equal "🌫", Symbolify.symbolify("🌫")
    end

    it "replaces C0 control characters" do
      assert_equal "␀", Symbolify.symbolify("\0")
      assert_equal "␊", Symbolify.symbolify("\n")
      assert_equal "␡", Symbolify.symbolify("\x7F")
    end

    it "replaces C1 control characters" do
      assert_equal "IND", Symbolify.symbolify("\u{84}")
    end

    it "replaces bidi control characters" do
      assert_equal "RLM", Symbolify.symbolify("\u{200F}")
      assert_equal "RLI", Symbolify.symbolify("\u{2067}")
    end

    it "prepends non-spacing marks with a dotted circle" do
      assert_equal "◌\u{0300}", Symbolify.symbolify("\u{0300}")
    end

    it "prepends enclosing marks with a space" do
      assert_equal " \u{20E3}", Symbolify.symbolify("\u{20E3}")
    end

    it "wraps blanks" do
      assert_equal "] [", Symbolify.symbolify(" ")
    end

    it "replaces tags" do
      assert_equal "TAG ␠", Symbolify.symbolify("\u{E0020}")
    end

    it "replaces variation selectors" do
      assert_equal "VS232", Symbolify.symbolify("\u{E01D7}")
    end

    it "works with unassigned characters" do
      assert_equal "n/a", Symbolify.symbolify("\u{FFFF}")
    end
  end

  describe ".byte" do
    it "works with normal characters" do
      assert_equal "A", Symbolify.symbolify("A".force_encoding("ISO-8859-1"))
    end

    it "works with C0 control characters" do
      assert_equal "␀", Symbolify.symbolify("\0".force_encoding("ISO-8859-1"))
      assert_equal "␊", Symbolify.symbolify("\n".force_encoding("ISO-8859-1"))
      assert_equal "␡", Symbolify.symbolify("\x7F".force_encoding("ISO-8859-1"))
    end

    it "works with C1 control characters (if encoding has C1)" do
      assert_equal "IND", Symbolify.symbolify("\x84".force_encoding("ISO-8859-1"))
    end

    it "works with blanks" do
      assert_equal "] [", Symbolify.symbolify(" ".force_encoding("ISO-8859-1"))
    end

    it "works with encodings that do not convert to UTF-8 (uses .dump)" do
      assert_equal '"a"',  Symbolify.symbolify("a".force_encoding("macThai"))
    end

    it "works with mac symbbols and logo bytes" do
      assert_equal "⌘", Symbolify.symbolify("\x11".force_encoding("macRoman"))
      assert_equal "Logo", Symbolify.symbolify("\xF0".force_encoding("macRoman"))
    end

    it "works with unassigned characters" do
      assert_equal "n/a", Symbolify.symbolify("\x81".force_encoding("Windows-1252"))
    end
  end

  describe ".ascii" do
    it "works with normal characters" do
      assert_equal "A", Symbolify.symbolify("A".force_encoding("US-ASCII"))
    end

    it "replaces C0 control characters" do
      assert_equal "␀", Symbolify.symbolify("\0".force_encoding("US-ASCII"))
      assert_equal "␊", Symbolify.symbolify("\n".force_encoding("US-ASCII"))
      assert_equal "␡", Symbolify.symbolify("\x7F".force_encoding("US-ASCII"))
    end

    it "wraps blanks" do
      assert_equal "] [", Symbolify.symbolify(" ".force_encoding("US-ASCII"))
    end
  end

  describe ".binary" do
    it "works with printable bytes" do
      assert_equal '"A"', Symbolify.symbolify("A".b)
    end

    it "works with unkhnown bytes" do
      assert_equal '"\x87"', Symbolify.symbolify("\x87".b)
    end
  end
end
