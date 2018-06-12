[![Build Status](https://travis-ci.com/sbohora/Somya.svg?token=shyYTzvvbsLRHsRAWXTg)](https://travis-ci.com/sbohora/Somya)

## Introduction
## Somya: Some outstanding magics you'd appreciate
This package provides some outstanding magical tricks/functions which are very useful in research, statistics and data science. This package has been named under my daughter `Somya`.

## Installation

``` r
# This package has not been submitted to CRAN yet. You can install its development version from GitHub.

# install.packages("devtools")
devtools::install_github("sbohora/Somya")
```

If any bug is encountered, please raise an issue with a minimal reproducible example on [GitHub](https://github.com/sbohora/Somya/issues).

## Few Examples

**`capitalize_each_word`**

```r
Somya::capitalize_each_word("make each letter in this string capitalized.", pattern = NULL)
[1] "Make Each Letter In This String Capitalized."
Somya::capitalize_each_word("make_each _etter_in_this_string_capitalized.", pattern = "[_]")
[1] "Make Each  Etter In This String Capitalized."
Somya::capitalize_each_word("make.each.letter.in.this.string.capitalized.", pattern = "[.]")
[1] "Make Each Letter In This String Capitalized "
```

**`compute_fibonacci`**

```r
Somya::compute_fibonacci(5)
[1] 5
> n = 10
> for (i in 0:(n-1)) {
+   print(compute_fibonacci(i))
+ }
[1] 0
[1] 1
[1] 1
[1] 2
[1] 3
[1] 5
[1] 8
[1] 13
[1] 21
[1] 34
```
**`is_palindrome`**

```r
Somya::is_palindrome("Was It A Rat I Saw?")
[1] TRUE
```

**`calculate_postfix`**

```r
Somya::calculate_postfix("2 3 1 * + 9 - ")
[1] "The result is: -4"
```

**`evaluate_prefix`**

```r
expr <- "+ 9 * - 2 5 + 3 2"
Somya::evaluate_prefix(expr)
[1] "The result is: -6"
```

**`split_rows_to_columns`**

```r
Somya::split_rows_to_columns(mtcars$mpg, number_rows = 5, col_name_prefix = "ID List")

  ID List 1 ID List 2 ID List 3 ID List 4 ID List 5 ID List 6 ID List 7
1      21.0      18.1      17.8      10.4      21.5      27.3      15.0
2      21.0      14.3      16.4      14.7      15.5      26.0      21.4
3      22.8      24.4      17.3      32.4      15.2      30.4        NA
4      21.4      22.8      15.2      30.4      13.3      15.8        NA
5      18.7      19.2      10.4      33.9      19.2      19.7        NA
```

**`count_words_in_string`**

```r
string = "This is a string. This is a a word. hora?"
Somya::count_words_in_string(string = string, pattern = "[ ]", remove_punctuation = TRUE)
  This     is      a string   word   hora 
     2      2      3      1      1      1 
```

**`swap_case`**
```r
s <- "thTs Is a 'R Case Swap Function 2'."
swap_case(s)
"THtS iS A 'r cASE sWAP fUNCTION 2'."
```

**`nepalese_words_to_number`**
```r
x = "ek karod paanch hajaar paanch saya paanch"
nepalese_words_to_number(x)
10005505
```