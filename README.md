# Lua Test Framework

## Using as a Git Submodule (recommended)

This is the recommended way to integrate the framework into your Lua project without copying files manually.

### 1. Add the submodule

From the root of your project, run:

```bash
git submodule add https://github.com/Saturn91/lua_testing_framework.git tests/unitTestLib
```

This places the framework at `tests/unitTestLib/`, which matches the require paths used internally.

### 2. Create your test file

Create `tests/unittests/test.lua`:

```lua
-- tests/unittests/test.lua
local myModule = require("src/myModule") -- your code under test

local M = {}
M.totalTime = 0

function M.run(t)
    t.newSection("myModule")
    t.assert_equal(myModule.add(1, 2), 3, "1 + 2 should equal 3")
    t.assert_equal(myModule.greet("world"), "hello world", "greet returns correct string")
end

return M
```

### 3. Run your tests

Run from your **project root** so the require paths resolve correctly:

```bash
lua tests/unitTestLib/main.lua      # quiet output (pass/fail summary only)
lua tests/unitTestLib/main.lua -l   # verbose output (all test details)
```

### Project layout

```
your-project/
├── src/
│   └── myModule.lua                ← your code
└── tests/
    ├── unitTestLib/                ← this submodule (contains main.lua)
    │   ├── main.lua
    │   ├── testlib.lua
    │   ├── JsonUtil.lua
    │   └── jsonDecode.lua
    └── unittests/
        └── test.lua                ← your tests (you create this)
```

---

## Manual setup (alternative)

1. copy the content of this git repo in your project.

2. make sure a Lua interpetor is installed so you can run .lua files from your terminal or commandline.

3. write your code in the tested_code.lua file (see example)

4. write tests in your test.lua file (see example)

5. run ```lua ./lib/main.lua``` to test

# API
The api is keept really simple, use t.assert_equal(a, b, "a has to equal b").

a and b are the two objects / variables or function outputs you whish to compare, the third (and optional) parameter is a description. The result will look like this for passed tests:

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