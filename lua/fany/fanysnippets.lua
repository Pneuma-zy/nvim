local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  -- add stm for cpp
  s("stm", {
    -- Simple static text.
    t({"#include <bits/stdc++.h>", "using namespace std;"}),
    t({"", "", "", "int main()", "{"}),
    t({"", "  "}),
    t({""}),
    i(1),
    t({"", "  return 0;"}),
    t({"", "}"}),
  }),
 -- for 循环
  s("for", {
    t("for ("),
    i(1),
    t("; "),
    i(2),
    t("; "),
    i(3),
    t({ ")", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- while 循环
  s("while", {
    t("while ("),
    i(1),
    t({ ")", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- if / elif / else
  s("if", {
    t("if ("),
    i(1),
    t({ ")", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  s("elif", {
    t("else if ("),
    i(1),
    t({ ")", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  s("else", {
    t({ "else", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- switch / case / default
  s("switch", {
    t("switch ("),
    i(1),
    t({ ")", "{", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  s("case", {
    t("case "),
    i(1),
    t({ ":", "  " }),
    i(0),
    t({ "", "  break;", "" }),
  }),

  s("default", {
    t({ "default:", "  " }),
    i(0),
    t({ "", "  break;", "" }),
  }),
})

ls.add_snippets("c", {
  -- add stm for c
  s("stm", {
    -- Simple static text.
    t({"#include<stdio.h>"}),
    t({"", "", "int main() {"}),
    t({"", "    "}),
    i(1),
    t({"", "    return 0;"}),
    t({"", "}"}),
  }),
  s("fanymain", {
    -- Simple static text.
    t({"", "", "int main() {"}),
    t({"", "    "}),
    i(1),
    t({"", "    return 0;"}),
    t({"", "}"}),
  }),
  s("/*", {
    -- Simple static text.
    t({"/* "}),
    i(1),
    t({" */"})
  }),
})
