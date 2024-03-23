local M = {}

M.name = "presets"

M.operators = {
  d = "Delete",
  c = "Change",
  y = "Yank (copy)",
  ["g~"] = "Toggle case",
  ["gu"] = "Lowercase",
  ["gU"] = "Uppercase",
  [">"] = "Indent right",
  ["<lt>"] = "Indent left",
  ["zf"] = "Create fold",
  ["!"] = "Filter through external program",
  ["v"] = "Visual Character Mode",
  -- ["V"] = "Visual Line Mode",
}

M.motions = {
  ["j"] = "Left",
  ["k"] = "Down",
  ["i"] = "Up",
  ["l"] = "Right",
  ["w"] = "Next word",
  ["%"] = "Matching character: '()', '{}', '[]'",
  ["b"] = "Previous word",
  ["e"] = "Next end of word",
  ["ge"] = "Previous end of word",
  ["0"] = "Start of line",
  ["^"] = "Start of line (non-blank)",
  ["$"] = "End of line",
  ["f"] = "Move to next char",
  ["F"] = "Move to previous char",
  ["t"] = "Move before next char",
  ["T"] = "Move before previous char",
  ["gg"] = "First line",
  ["G"] = "Last line",
  ["{"] = "Previous empty line",
  ["}"] = "Next empty line",
}

M.objects = {
  a = { name = "around" },
  h = { name = "inside" },
  ['a"'] = [[double quoted string]],
  ["a'"] = [[single quoted string]],
  ["a("] = [[same as ab]],
  ["a)"] = [[same as ab]],
  ["a<lt>"] = [[a <> from '<' to the matching '>']],
  ["a>"] = [[same as a<]],
  ["aB"] = [[a Block from [{ to ]} (with brackets)]],
  ["aW"] = [[a WORD (with white space)]],
  ["a["] = [[a [] from '[' to the matching ']']],
  ["a]"] = [[same as a[]],
  ["a`"] = [[string in backticks]],
  ["ab"] = [[a block from [( to ]) (with braces)]],
  ["ap"] = [[a paragraph (with white space)]],
  ["as"] = [[a sentence (with white space)]],
  ["at"] = [[a tag block (with white space)]],
  ["aw"] = [[a word (with white space)]],
  ["a{"] = [[same as aB]],
  ["a}"] = [[same as aB]],
  ['h"'] = [[double quoted string without the quotes]],
  ["h'"] = [[single quoted string without the quotes]],
  ["h("] = [[same as hb]],
  ["h)"] = [[same as hb]],
  ["h<lt>"] = [[inner <> from '<' to the matching '>']],
  ["h>"] = [[same as h<]],
  ["hB"] = [[inner Block from [{ and ]}]],
  ["hW"] = [[inner WORD]],
  ["h["] = [[inner [] from '[' to the matching ']']],
  ["h]"] = [[same as h[]],
  ["h`"] = [[string in backticks without the backticks]],
  ["hb"] = [[inner block from [( to ])]],
  ["hp"] = [[inner paragraph]],
  ["hs"] = [[inner sentence]],
  ["ht"] = [[inner tag block]],
  ["hw"] = [[inner word]],
  ["h{"] = [[same as hB]],
  ["h}"] = [[same as hB]],
}

---@param config Options
function M.setup(wk, opts, config)
  require("which-key.plugins.presets.misc").setup(wk, opts)

  -- Operators
  if opts.operators then
    for op, label in pairs(M.operators) do
      config.operators[op] = label
    end
  end

  -- Motions
  if opts.motions then
    wk.register(M.motions, { mode = "n", prefix = "", preset = true })
    wk.register(M.motions, { mode = "o", prefix = "", preset = true })
  end

  -- Text objects
  if opts.text_objects then
    wk.register(M.objects, { mode = "o", prefix = "", preset = true })
  end
end

return M
