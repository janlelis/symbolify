# Symbolify [![[version]](https://badge.fury.io/rb/symbolify.svg)](http://badge.fury.io/rb/symbolify)  [![[travis]](https://travis-ci.org/janlelis/symbolify.svg)](https://travis-ci.org/janlelis/symbolify)

Safely print all codepoints from Unicode and single-byte encodings in UTF-8. It replaces control and non-printable characters with readable equivalents and wraps most blank characters in `]` and `[`.

Programs that make use of this library: [unibits](https://github.com/janlelis/unibits), [uniscribe](https://github.com/janlelis/uniscribe)

## Setup

Add to your `Gemfile`:

```ruby
gem 'symbolify'
```

## Usage

```ruby
Symbolify.symbolify "A"
```

## MIT License

Copyright (C) 2017 Jan Lelis <http://janlelis.com>. Released under the MIT license.
