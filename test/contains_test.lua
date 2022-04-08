require('luacov')
local assert = require('assert')
local contains = require('string.contains')

local function test_contains()
    -- test that return true
    assert(contains('foo bar baz', 'bar '))

    -- test that substring use as pattern
    assert(contains('foo bar baz', 'bar%s*baz', true))

    -- test that pattern does not match
    assert(not contains('foo bar baz', 'bar%s*b'))

    -- test that throw erorr if s is not string
    local err = assert.throws(function()
        contains()
    end)
    assert.match(err, '#1 (string expected,')

    -- test that throw erorr if pattern is not string
    err = assert.throws(function()
        contains('foo')
    end)
    assert.match(err, '#2 (string expected,')

    -- test that throw erorr if is_pattern is not boolean
    err = assert.throws(function()
        contains('foo', 'bar', 1)
    end)
    assert.match(err, '#3 (nil or boolean expected,')
end

local function test_contains_prefix()
    local prefix = 'foo'

    -- test that returns true
    for _, v in ipairs({
        'foo/bar/baz',
        'foo bar baz',
        'foo',
    }) do
        assert(contains.prefix(v, prefix))
    end

    -- test that prefix use as pattern string
    assert(contains.prefix('hello world', 'hel+o', true))

    -- test that returns false
    for _, v in ipairs({
        '',
        'bar/baz/qux',
        'bar baz qux',
        ' foo ',
    }) do
        assert(not contains.prefix(v, prefix))
    end

    -- test that throw erorr if s is not string
    local err = assert.throws(function()
        contains.prefix()
    end)
    assert.match(err, '#1 (string expected,')

    -- test that throw erorr if s is not string
    err = assert.throws(function()
        contains.prefix('baz')
    end)
    assert.match(err, '#2 (string expected,')

    -- test that throw erorr if is_pattern is not boolean
    err = assert.throws(function()
        contains.prefix('foo', 'bar', 1)
    end)
    assert.match(err, '#3 (nil or boolean expected,')
end

local function test_contains_suffix()
    local suffix = 'baz'

    -- test that returns true
    for _, v in ipairs({
        'foo/bar/baz',
        'foo bar baz',
        'baz',
    }) do
        assert(contains.suffix(v, suffix))
    end

    -- test that suffix as pattern string
    assert(contains.suffix('hello world', 'w.+ld', true))

    -- test that returns false
    for _, v in ipairs({
        '',
        'foo/bar/baz/qux',
        'foo bar baz qux',
        'baz ',
    }) do
        assert(not contains.suffix(v, suffix))
    end

    -- test that throw erorr if s is not string
    local err = assert.throws(function()
        contains.suffix()
    end)
    assert.match(err, '#1 (string expected,')

    -- test that throw erorr if s is not string
    err = assert.throws(function()
        contains.suffix('foo')
    end)
    assert.match(err, '#2 (string expected,')

    -- test that throw erorr if is_pattern is not boolean
    err = assert.throws(function()
        contains.suffix('foo', 'bar', 1)
    end)
    assert.match(err, '#3 (nil or boolean expected,')
end

test_contains()
test_contains_prefix()
test_contains_suffix()
