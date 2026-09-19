# Symbolify [![[version]](https://badge.fury.io/rb/symbolify.svg)](https://badge.fury.io/rb/symbolify)  [![[ci]](https://github.com/janlelis/symbolify/workflows/Test/badge.svg)](https://github.com/janlelis/symbolify/actions?query=workflow%3ATest)

Safely print all codepoints from Unicode and single-byte encodings in UTF-8. It replaces control and non-printable characters with readable equivalents and wraps most blank characters in `]` and `[`.

Programs that make use of this library: [unibits](https://github.com/janlelis/unibits), [uniscribe](https://github.com/janlelis/uniscribe)

## Setup

Add to your `Gemfile`:

```ruby
gem 'symbolify'
```

## Usage

```ruby
puts Symbolify.symbolify "A"   # A
puts Symbolify.symbolify "🌫"   # 🌫
puts Symbolify.symbolify "\0"   # ␀
puts Symbolify.symbolify "\n"   # ␊
puts Symbolify.symbolify "\x7F"   # ␡
puts Symbolify.symbolify "\u{84}"   # IND
puts Symbolify.symbolify "\u{200F}"   # RLM
puts Symbolify.symbolify "\u{2067}"   # RLI
puts Symbolify.symbolify "\u{0300}"   # ◌̀
puts Symbolify.symbolify " "   # ] [
puts Symbolify.symbolify "\u{FFF9}"   # IAA
puts Symbolify.symbolify "\u{FFFC}"   # OBJ
puts Symbolify.symbolify "\u{E0020}"   # TAG ␠
puts Symbolify.symbolify "\u{E01D7}"   # VS232
puts Symbolify.symbolify "\u{D0000}"   # n/a
puts Symbolify.symbolify "\u{E0000}"   # n/a*
puts Symbolify.symbolify "\u{10FFFF}"   # n/c
puts Symbolify.symbolify "\x80"   # �
```

## MIT License

Copyright (C) 2017-2026 Jan Lelis <https://janlelis.com>. Released under the MIT license.
