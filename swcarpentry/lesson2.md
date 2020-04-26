---
title: "Lesson2"
output: 
   html_document:
     keep_md: true
---

<br>

**Defining function:**


```r
fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
```

**Using function:**

```r
fahrenheit_to_celsius(32)
```

```
## [1] 0
```

```r
fahrenheit_to_celsius(212)
```

```
## [1] 100
```

<br>

**Automatic returns:**

In R, **it is not necessary to include the return statement.** R automatically returns whichever variable is on the last line of the body of the function. While in the learning phase, we will explicitly define the return statement.

<br>

**Creating another function**


```r
celsius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}
```

**Composing functions**


```r
fahrenheit_to_kelvin <- function(temp_F) {
  temp_C <- fahrenheit_to_celsius(temp_F)
  temp_K <- celsius_to_kelvin(temp_C)
  return(temp_K)
}
```

**Nesting Functions**
    
This example showed the output of `fahrenheit_to_celsius` assigned to `temp_C`, which is then passed to `celsius_to_kelvin` to get the final result. It is also possible to perform this calculation in one line of code, by “nesting” one function inside another, like so:


```r
# freezing point of water in Fahrenheit
celsius_to_kelvin(fahrenheit_to_celsius(32.0))
```

```
## [1] 273.15
```
<br>

**Exercise**

In the last lesson, we learned to combine elements into a vector using the c function, e.g. `x <- c("A", "B", "C")` creates a vector `x` with three elements. Furthermore, we can extend that vector again using c, e.g. `y <- c(x, "D")` creates a vector y with four elements. Write a function called highlight that takes two vectors as arguments, called content and wrapper, and returns a new vector that has the wrapper vector at the beginning and end of the content.

Resolution:


```r
#Defining function:
highlight <- function(content, wrapper) {
  return(c(wrapper, content, wrapper))
}

#Using function
best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  # R interprets a variable with a single value as a vector
                   # with one element.

highlight(best_practice, asterisk)
```

```
## [1] "***"       "Write"     "programs"  "for"       "people"    "not"      
## [7] "computers" "***"
```

**Exercise**

If the variable v refers to a vector, then `v[1]` is the vector’s first element and `v[length(v)]` is its last (the function length returns the number of elements in a vector). Write a function called edges that returns a vector made up of just the first and last elements of its input.

Resolution:


```r
edges <- function(vec) {
  return(c(vec[1], vec[length(vec)]))
}

edges(c("Don't", "repeat", "yourself", "or", "others"))
```

```
## [1] "Don't"  "others"
```
<!--
#Continue at **Named Variables and the Scope of Variables** #http://swcarpentry.github.io/r-novice-inflammation/02-func-R/index.html
--
