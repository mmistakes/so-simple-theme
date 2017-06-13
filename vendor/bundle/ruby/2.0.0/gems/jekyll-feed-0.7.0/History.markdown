## 0.7.0 / 2016-09-06

  * Use type="html" to skirt around double escaping problem (#127)

## 0.6.0 / 2016-07-08

  * Cleanup `post_author` logic (#113)
  * Add XML stylesheet example with XSLT (#119)
  * DRY up and add more doc (#120)
  * Use smartify filter (#117)

## 0.5.1 / 2016-04-18

  * Fix mangling of whitespace when `site.lang` is set (#110)

## 0.5.0 / 2016-04-13

  * Consolidate regexps for stripping whitespace (#82)
  * Only test against Jekyll 3 (#99)
  * Think about how i18n might work (#75)
  * Find author by reference (#106)
  * Drop support for Jekyll 2 (#105)
  * Add support for post image (#104)

### Minor Enhancements

  * Use Module#method_defined? (#83)
  * Use site.title for meta tag if available (#100)

### Development Fixes

  * Do not require [**jekyll-last-modified-at**](https://github.com/gjtorikian/jekyll-last-modified-at) in tests (#87)
  * Add Rubocop (#81)
  * Correct typo in tests (#102)
  * Simplify testing feed_meta tag (#101)
  * Quiet known warnings in tests (#103)

## 0.4.0 / 2015-12-30

  * Feed uses `site.title`, or `site.name` if `title` doesn't exist (#72)
  * Replace newlines with spaces in `title` and `summary` elements (#67)
  * Properly render post content with Jekyll (#73)
