--
-- Copyright (C) 2022 Masatoshi Fukunaga
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--- file-scope variables
local error = error
local type = type
local find = string.find
local format = string.format
local sub = string.sub

--- contains tests whether the pattern is contained in s or not.
--- @param s string
--- @param ss string
--- @param is_pattern boolean
--- @return boolean
local function contains(_, s, ss, is_pattern)
    if type(s) ~= 'string' then
        error(format('invalid argument #1 (string expected, got %s)', type(s)),
              2)
    elseif type(ss) ~= 'string' then
        error(format('invalid argument #2 (string expected, got %s)', type(ss)),
              2)
    elseif is_pattern ~= nil and type(is_pattern) ~= 'boolean' then
        error(format('invalid argument #3 (nil or boolean expected, got %s)',
                     type(is_pattern)), 2)
    end

    return find(s, ss, nil, is_pattern ~= true) and true or false
end

--- contain_suffix tests whether s ends with suffix
--- @param s string
--- @param suffix string
--- @param is_pattern boolean
--- @return boolean
local function contain_suffix(s, suffix, is_pattern)
    if type(s) ~= 'string' then
        error(format('invalid argument #1 (string expected, got %s)', type(s)),
              2)
    elseif type(suffix) ~= 'string' then
        error(format('invalid argument #2 (string expected, got %s)',
                     type(suffix)), 2)
    elseif is_pattern == nil then
        local slen = #suffix
        if #s < slen then
            return false
        end
        return s == suffix or sub(s, -slen) == suffix
    elseif type(is_pattern) ~= 'boolean' then
        error(format('invalid argument #3 (nil or boolean expected, got %s)',
                     type(is_pattern)), 2)
    elseif sub(suffix, -1) ~= '$' then
        suffix = suffix .. '$'
    end

    return find(s, suffix) and true or false
end

--- contain_prefix tests whether s starts with prefix
--- @param s string
--- @param prefix string
--- @param is_pattern boolean
--- @return boolean
local function contain_prefix(s, prefix, is_pattern)
    if type(s) ~= 'string' then
        error(format('invalid argument #1 (string expected, got %s)', type(s)),
              2)
    elseif type(prefix) ~= 'string' then
        error(format('invalid argument #2 (string expected, got %s)',
                     type(prefix)), 2)
    elseif is_pattern == nil then
        local plen = #prefix
        if #s < plen then
            return false
        end
        return s == prefix or sub(s, 1, plen) == prefix
    elseif type(is_pattern) ~= 'boolean' then
        error(format('invalid argument #3 (nil or boolean expected, got %s)',
                     type(is_pattern)), 2)
    elseif sub(prefix, 1, 1) ~= '^' then
        prefix = '^' .. prefix
    end

    return find(s, prefix) and true or false
end

return setmetatable({
    prefix = contain_prefix,
    suffix = contain_suffix,
}, {
    __call = contains,
})
