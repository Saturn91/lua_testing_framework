# Lua Test Frame work

1. copy the content of this git repo in your project.

2. make sure a Lua interpetor is installed so you can run .lua files from your terminal or commandline.

3. write your code in the tested_code.lua file (see example)

4. write tests in your test.lua file (see example)

5. run ```lua ./lib/main.lua``` to test

# API
The api is keept really simple, use t.assert_equal(a, b, "a has to equal b").
a and b are the two objects / variables or function outputs you whish to compare, the third (and optional) parameter is a description. The result will look like this

So to test if this function works correctly
```lua
function is_hello(text)
  return text == 'hello'
end
```
1. Write the folowing code in the tested_code.lua file
```lua
function is_hello(text)
  return text == 'hello'
end

function code.is_hello(text)
    return (sort(text))
end
```
2. Add the actual test function in the test.lua file in the run() function
```lua
function test.run()
    t.assert_equal(c.is_hello('hello'),true,"should be hello")
    t.assert_equal(c.is_hello('not hello'),false,"should not be hello")
end
```
3. run the test to see if you implemented your function correctly ```lua ./lib/main.lua``` to test


for passed tests:

```
...>lua ./lib/main.lua         


-----Test starts-----
[info]: test succeded: 4/4 passed
```

And like this for failed tests

```
...>lua ./lib/main.lua


-----Test starts-----
--> [error]: test sort failed -> 1,2,3,4, != 1,2,3,3,
--> [error]: 1/3 tests failed!
```
