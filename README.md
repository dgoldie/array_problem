# Array Utility exercise

### ArrayUtils#sort_and_fill
1. Write a ruby method that given an array of unsorted numbers returns the missing 
number in the natural range for that array.


USAGE:

This is how you run the specs:

```
➜  array_problem rspec

ArrayUtils
  #new
    takes an array and returns a util object
    raises an error when input isn't an array
  #sort_and_fill
    takes a short array and returns the same array
    fills array with one missing element
    fills array with multiple missing elements
    sorts and fills unsorted array with multiple missing elements
    sorts and fills array with missing elements in other sequence

Finished in 0.00429 seconds (files took 0.07648 seconds to load)
7 examples, 0 failures
```

How to use in the console:

```
➜  array_problem irb 

Frame number: 0/7
[1] pry(main)> load 'array_utils.rb'
=> true
[2] pry(main)> arr = ArrayUtils.new([1,2,3,4])
=> #<ArrayUtils:0x007fbb23a1aa50 @array=[1, 2, 3, 4]>
[3] pry(main)> arr.sort_and_fill
=> [1, 2, 3, 4]
[4] pry(main)> 
```
