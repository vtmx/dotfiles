-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vitor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/vitor/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/vitor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/vitor/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vitor/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["better-escape.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/opt/better-escape.vim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/bufferline.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["shade.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/tmux.nvim"
  },
  ["toggleterm.nvim"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/vitor/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end