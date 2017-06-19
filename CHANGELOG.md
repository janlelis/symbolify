## CHANGELOG

### 1.3.0

* Unicode 10 general categories

### 1.2.0

* Return "n/a*" for unassigned codepoints which are ignorable
* Change "TAG ␡" to "TAG ✦"

### 1.1.0

* Add special characters (U+FFF9 - U+FFFC)
* Non-control separators return ⏎
* Ensure that only first character/codepoint will be returned

### 1.0.0

* Import from unibits gem
* Freeze all string literals
* Automatically create characteristics of character when it is not passed in explicitly
* Add generic "dump" method of symbolificaton, which is used by `Symbolify.binary`
* Fix that correct tag names are used
* Support non-characters
