local gl = require('galaxyline')
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default
local colors = {
    -- bg = '#2E2E2E',
    bg = '#292D38',
    yellow = '#DCDCAA',
    dark_yellow = '#D7BA7D',
    cyan = '#4EC9B0',
    green = '#608B4E',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FF8800',
    purple = '#C586C0',
    magenta = '#D16D9E',
    grey = '#858585',
    blue = '#569CD6',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#D16969',
    error_red = '#F44747',
    info_yellow = '#FFCC66'
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.green,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return '▊ '
        end,
        highlight = {colors.red, colors.bg}
    }
}
print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[3] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.green, colors.bg}
    }
}
gls.left[5] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' 柳',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[6] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = '  ',
        highlight = {colors.red, colors.bg}
    }
}

gls.right[1] = {
    DiagnosticError = {provider = 'DiagnosticError', icon = '  ', highlight = {colors.error_red, colors.bg}}
}
gls.right[2] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.orange, colors.bg}}}

gls.right[3] = {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = '  ', highlight = {colors.vivid_blue, colors.bg}}
}

gls.right[4] = {DiagnosticInfo = {provider = 'DiagnosticInfo', icon = '  ', highlight = {colors.info_yellow, colors.bg}}}

gls.right[5] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [' '] = true}
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = '  ',
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[6] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '  ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[7] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[8] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[9] = {
    BufferType = {
        provider = 'FileTypeName',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[10] = {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.right[11] = {
    Space = {
        provider = function()
            return ' '
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.grey, colors.bg}
    }
}

gls.short_line_left[2] = {
    SFileName = {provider = 'SFileName', condition = condition.buffer_not_empty, highlight = {colors.grey, colors.bg}}
}

gls.short_line_right[1] = {BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}}
-- require'nvim-web-devicons'.setup()
-- 
-- local gl = require('galaxyline')
-- local gls = gl.section
-- gl.short_line_list = {'LuaTree','vista','dbui'}
-- 
-- local colors = {
--   bg = '#282828',
--   yellow = '#d8a657',
--   cyan = '#89b482',
--   darkblue = '#45707a',
--   green = '#a9b665',
--   orange = '#e78a4e',
--   purple = '#d3869b',
--   magenta = '#c14a4a',
--   grey = '#a89984',
--   blue = '#7daea3',
--   red = '#ea6962'
-- }
-- 
-- local buffer_not_empty = function()
--   if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
--     return true
--   end
--   return false
-- end
-- 
-- gls.left[1] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_text = {n = '<|',
--       i = '|>',
--       v = '<>',
--       [''] = '<>',
--       V = '<>',
--     }
-- 
--     local mode_color = {n = colors.yellow,
--     i = colors.green,
--     v = colors.blue,
--     [''] = colors.blue,
--     V = colors.blue,
--     c = colors.purple,
--     no = colors.magenta,
--     s = colors.orange,
--     S = colors.orange,
--     [''] = colors.orange,
--     ic = colors.yellow,
--     R = colors.red,
--     Rv = colors.red,
--     cv = colors.red,
--     ce=colors.red,
--     r = colors.cyan,
--     rm = colors.cyan,
--     ['r?'] = colors.cyan,
--     ['!']  = colors.red,
--     t = colors.red}
--     vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
--     -- vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
--     return '  NV-IDE '--..mode_text[vim.fn.mode()]
--   end,
--   separator = ' ',
--   separator_highlight = {colors.yellow,function()
--     if not buffer_not_empty() then
--       return colors.bg
--     end
--     return colors.bg
--   end},
--   highlight = {colors.bg,colors.bg,'bold'},
-- }
-- }
-- 
-- gls.left[2] = {
--   SymbolMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_text = {n = '<|',
--       i = '|>',
--       v = '<>',
--       [''] = '<>',
--       V = '<>',
--     }
-- 
--     local mode_color = {n = colors.yellow,
--     i = colors.green,
--     v = colors.blue,
--     [''] = colors.blue,
--     V = colors.blue,
--     c = colors.purple,
--     no = colors.magenta,
--     s = colors.orange,
--     S = colors.orange,
--     [''] = colors.orange,
--     ic = colors.yellow,
--     R = colors.red,
--     Rv = colors.red,
--     cv = colors.red,
--     ce=colors.red,
--     r = colors.cyan,
--     rm = colors.cyan,
--     ['r?'] = colors.cyan,
--     ['!']  = colors.red,
--     t = colors.red}
--     vim.api.nvim_command('hi GalaxySymbolMode guifg='..mode_color[vim.fn.mode()])
--     return mode_text[vim.fn.mode()]
--   end,
--   separator = ' ',
--   highlight = {colors.bg,colors.bg,'bold'},
-- }
-- }
-- 
-- gls.left[3] = {
--   FileName = {
--     -- provider = 'FileName',
--     provider = function()
--       return vim.fn.expand("%:F")
--     end,
--     condition = buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.gray,colors.bg},
--     highlight = {colors.gray,colors.bg, 'bold'}
--   }
-- }
-- gls.left[4] = {
--   GitIcon = {
--     provider = function() return ' ' end,
--     condition = buffer_not_empty,
--     highlight = {colors.orange,colors.bg},
--   }
-- }
-- gls.left[5] = {
--   GitBranch = {
--     provider = 'GitBranch',
--     separator = ' ',
--     separator_highlight = {colors.purple,colors.bg},
--     condition = buffer_not_empty,
--     highlight = {colors.yellow,colors.bg, 'bold'},
--   }
-- }
-- 
-- local checkwidth = function()
--   local squeeze_width  = vim.fn.winwidth(0) / 2
--   if squeeze_width > 40 then
--     return true
--   end
--   return false
-- end
-- 
-- gls.left[6] = {
--   DiffAdd = {
--     provider = 'DiffAdd',
--     condition = checkwidth,
--     -- separator = ' ',
--     -- separator_highlight = {colors.purple,colors.bg},
--     icon = '  ',
--     highlight = {colors.green,colors.bg, 'bold'},
--   }
-- }
-- gls.left[7] = {
--   DiffModified = {
--     provider = 'DiffModified',
--     condition = checkwidth,
--     -- separator = ' ',
--     -- separator_highlight = {colors.purple,colors.bg},
--     icon = '  ',
--     highlight = {colors.blue,colors.bg, 'bold'},
--   }
-- }
-- gls.left[8] = {
--   DiffRemove = {
--     provider = 'DiffRemove',
--     condition = checkwidth,
--     -- separator = ' ',
--     -- separator_highlight = {colors.purple,colors.bg},
--     icon = '  ',
--     highlight = {colors.red,colors.bg, 'bold'},
--   }
-- }
-- gls.left[9] = {
--   DiagnosticError = {
--     provider = 'DiagnosticError',
--     icon = '  ',
--     highlight = {colors.red,colors.bg, 'bold'}
--   }
-- }
-- gls.left[10] = {
--   Space = {
--     provider = function () return '' end
--   }
-- }
-- gls.left[11] = {
--   DiagnosticWarn = {
--     provider = 'DiagnosticWarn',
--     icon = '  ',
--     highlight = {colors.yellow,colors.bg, 'bold'},
--   }
-- }
-- gls.left[12] = {
--   DiagnosticHint = {
--     provider = 'DiagnosticHint',
--     icon = '   ',
--     highlight = {colors.blue,colors.bg, 'bold'},
--   }
-- }
-- gls.left[13] = {
--   DiagnosticInfo = {
--     provider = 'DiagnosticInfo',
--     icon = '   ',
--     highlight = {colors.orange,colors.bg, 'bold'},
--     separator = ' '
--   }
-- }
-- gls.left[14] = {
--   VistaPlugin = {
--     provider = function()
--       if (vim.b.vista_nearest_method_or_function == nil) then
--         return ''
--       elseif (vim.b.vista_nearest_method_or_function == '') then
--         return ''
--       else
--         return '  -> '..vim.b.vista_nearest_method_or_function
--       end
--     end,
--     separator = ' ',
--     separator_highlight = {colors.purple,colors.bg},
--     condition = buffer_not_empty,
--     highlight = {colors.purple, colors.bg, 'bold'}
--   }
-- }
-- 
-- -- RIGHT
-- 
-- gls.right[1] ={
--   FileIcon = {
--     separator = ' ',
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg, 'bold'},
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--   },
-- }
-- gls.right[2] = {
--   FileSize = {
--     provider = 'FileSize',
--     condition = buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.darkblue,colors.bg, 'bold'}
--   }
-- }
-- -- gls.right[3] ={
-- --   Ruby = {
-- --     separator = ' ',
-- --     provider = function()
-- --       return ' '..vim.fn['rvm#string']()
-- --     end,
-- --     separator_highlight = {colors.yellow,colors.bg, 'bold'},
-- --     highlight = {colors.red,colors.bg, 'bold'}
-- --   },
-- -- }
-- gls.right[4]= {
--   FileEncode = {
--     separator = ' ',
--     provider = 'FileEncode',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.grey,colors.bg, 'bold'},
--   }
-- }
-- gls.right[5]= {
--   FileFormat = {
--     separator = ' ',
--     provider = 'FileFormat',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.grey,colors.bg, 'bold'},
--   }
-- }
-- gls.right[6] = {
--   LineInfo = {
--     separator = ' ',
--     provider = 'LineColumn',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.grey,colors.bg, 'bold'},
--   },
-- }
-- gls.right[7] = {
--   PerCent = {
--     provider = 'LinePercent',
--     separator = ' ',
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--     highlight = {colors.grey,colors.bg, 'bold'},
--   }
-- }
-- gls.right[8] = {
--   ScrollBar = {
--     provider = 'ScrollBar',
--     highlight = {colors.yellow,colors.bg, 'bold'},
--   }
-- }
-- 
-- gls.short_line_left[1] ={
--   FileIconS = {
--     separator = ' ',
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {colors.yellow, colors.bg, 'bold'},
--     separator_highlight = {colors.yellow,colors.bg, 'bold'},
--   },
-- }
-- 
-- gls.short_line_left[2] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {colors.purple,colors.bg, 'bold'},
--     highlight = {colors.bg,colors.yellow,'bold'}
--   }
-- }
-- 
-- gl.short_line_list = {'Nvimtree','vista','fzf', 'startify', '__CtrlSF__'}
-- 
-- gls.short_line_right[1] = {
--   SFileName = {
--     provider = function()
--       local fileinfo = require("galaxyline.provider_fileinfo")
--       local fname = fileinfo.get_current_file_name()
--       for _, v in ipairs(gl.short_line_list) do
--         if v == vim.bo.filetype then
--           return ""
--         end
--       end
--       return fname
--     end,
--     condition = buffer_not_empty,
--     highlight = {colors.gray,colors.bg,'bold'}
--   }
-- }
-- 
-- gls.short_line_right[2] = {
--   BufferIcon = {
--     provider= 'BufferIcon',
--     separator = ' ',
--     separator_highlight = {colors.yellow,colors.bg},
--     highlight = {colors.yellow,colors.purple}
--   }
-- }
