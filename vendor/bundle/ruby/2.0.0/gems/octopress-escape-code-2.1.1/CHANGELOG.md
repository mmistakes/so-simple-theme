# Changelog

### 2.1.1 - 2015-12-09
- Removed debug trace

### 2.1.0 - 2015-12-09
- Now supports Jekyll 3+

### 2.0.6 - 2015-01-04
- Updated docs with better installation instructions.

### 2.0.5 - 2015-01-04
- Updated docs

### 2.0.5 - 2015-01-04
- Simplified code escaping system, reducing use of raw tags.

### 2.0.4 - 2015-01-03
- Updated regex order to allow different nested code block types.

### 2.0.3 - 2015-01-03
- Set plugin priority to lowest, ensuring that code is escaped after all hooks.

### 2.0.2 - 2015-01-02
- Fixed issue where insignificant whitespace would break escaping.
- Simplified space and tab code block matching expressions.

### 2.0.1 - 2014-12-19
- Fixed issue where code blocks would get additional whitespace.

### 2.0.0 - 2014-12-18
- Site-wide code escaping now defaults to false.

### 1.0.4 - 2014-12-10
- Added support for documentation in Octopress docs.
- Now preserving hand written raw tags inside of code blocks.

### 1.0.3 - 2014-12-10
Fixes:
- Random tabs don't trigger escapes.
- Raw tags inside of code fences are properly stripped.
- Double in-line code backticks are properly escaped.

### 1.0.2 - 2014-9-13
- Fix: Removing extra raw tags in markdown code blocks.

### 1.0.1 - 2014-9-12
- Upgraded to octopress-hooks 2.

### 1.0.0 - 2014-7-20
- Initial release.
