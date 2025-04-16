local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local s = luasnip.snippet
local t = luasnip.text_node
local f = luasnip.function_node
local i = luasnip.insert_node

-- Helper function to get the filename without the extension
local function get_filename_without_extension()
	local filename = vim.fn.expand("%:t")       -- Get the current file name with extension
	return filename:match("(.+)%..+$") or filename -- Remove the extension, or return filename if no extension
end

luasnip.add_snippets("cpp", {
	s("usacomain", {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"int main() {",
			"\t",
		}),
		f(function()
			local filename = get_filename_without_extension()
			return string.format("freopen(\"%s.in\", \"r\", stdin);", filename)
		end, {}),
		t({ "", "\t" }),
		f(function()
			local filename = get_filename_without_extension()
			return string.format(
				"freopen(\"%s.out\", \"w\", stdout);",
				filename
			)
		end, {}),
		t({ "", "\t" }),
		t({ "", "\t" }),
		i(0),
		t({ "", "", "\treturn 0;", "}" }),
	}),
})
