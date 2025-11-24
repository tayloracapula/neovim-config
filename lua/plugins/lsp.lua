return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
	-- main one
	{ "ms-jpq/coq_nvim", branch = "coq" },

	-- 9000+ Snippets
	{ "ms-jpq/coq.artifacts", branch = "artifacts" },

	-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
	-- Need to **configure separately**
	{ 'ms-jpq/coq.thirdparty', branch = "3p" },
    },
    init = function()
	vim.g.coq_settings = {
	    auto_start = "shut-up",
	}
    end,
    config = function()
	local coq = require("coq")
	vim.keymap.set('i', '<Tab>', function()
	    if vim.fn.pumvisible() == 1 then
	    return '<C-n>'
	    else
	    return vim.fn['coq#Nav']('next')
	    end
	end, { expr = true, silent = true })

	vim.keymap.set('i', '<S-Tab>', function()
	    if vim.fn.pumvisible() == 1 then
	    return '<C-p>'
	    else
	    return vim.fn['coq#Nav']('prev')
	    end
	end, { expr = true, silent = true })

	vim.lsp.config('ts_ls',{
	    coq.lsp_ensure_capabilities({
	   settings = {
          typescript = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            includeCompletionsWithInsertText = true,
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
            },
          },
          javascript = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
        init_options = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            includeCompletionsWithInsertText = true,
          },
        }, 
	})})
	vim.lsp.enable('ts_ls')

	vim.lsp.config('rust_analyzer', {
	  settings = {
	    ['rust-analyzer'] = {
		checkOnSave = {
		    command = "clippy"
		},
		diagnostics = {
		    enable = true;
		    experimental = {
			enable = true
		    },
		    completion = {
			callable = {
			    snippets = "fill_arguments",
			}
		    },
			inlayHints = {
          enable = true,
          showParameterNames = true,
          parameterHintsPrefix = "<- ",
          otherHintsPrefix = "=> ",
          maxLength = 25,
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = "never",
          },
          lifetimeElisionHints = {
            enable = "never",
            useParameterNames = false,
          },
          typeHints = {
            enable = true,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
		}
	    }
	  }
	})
	vim.lsp.enable('rust_analyzer')

	vim.lsp.config('clangd', {
	    coq.lsp_ensure_capabilities({
		cmd = {
		    "clangd",
		    "--background-index",
		    "--clang-tidy",
		    "--header-insertion=iwyu",
		    "--completion-style=detailed",
		    "--function-arg-placeholders",
		    "--fallback-style=llvm",
		},
		init_options = {
		    usePlaceholders = true,
		    completeUnimported = true,
		    clangdFileStatus = true,
		},
	    })
	})

    end,
}
