local fn = vim.fn
local installPath = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

--install packer if not installed already
if fn.empty(fn.glob(installPath)) > 0 then
  PACKER_BOOTSTRAP = fn.system{
  "git",
  "clone",
  "--depth",
  "1",
  "https://github.com/wbthomason/packer.nvim",
  installPath,
  }
  print("installing Packer")
end

vim.cmd[[packadd packer.nvim]]

--initlize packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer module not found")
  return
end

packer.init{

}

return require('packer').startup(function(use)

  -------plugins-----
  --Packer---------------------------------------------------------------------------
  use {"wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3"}
  -----------------------------------------------------------------------------------

  --Dependecies
  use {"nvim-lua/popup.nvim"  , commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac"}
  use {"nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35"}

  --Cmp and Snippets
  use {"hrsh7th/nvim-cmp"            , commit = "5a11682453ac6b13dbf32cd403da4ee9c07ef1c3"}
  use {"hrsh7th/cmp-buffer"          , commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"}
  use {"hrsh7th/cmp-path"            , commit = "91ff86cd9c29299a64f968ebb45846c485725f23"}
  use {"hrsh7th/cmp-cmdline"         , commit = "d250c63aa13ead745e3a40f61fdd3470efde3923"}
  use {"saadparwaiz1/cmp_luasnip"    , commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90"}
  use {"L3MON4D3/LuaSnip"            , commit = "c9b9a22904c97d0eb69ccb9bab76037838326817"}
  use {"rafamadriz/friendly-snippets", commit = "efff286dd74c22f731cdec26a70b46e5b203c619"}

  --LSP 
  use {"neovim/nvim-lspconfig"            , commit = "9e932edb0af4e20880685ddb96a231669fbe8091"}
  use {"hrsh7th/cmp-nvim-lsp"             , commit = " 99290b3ec1322070bcfb9e846450a46f6efa50f0"}
  use {"hrsh7th/cmp-nvim-lua"}
  use {"williamboman/mason.nvim"          , commit = "fc98833b6da5de5a9c5b1446ac541577059555be"}
  use {"williamboman/mason-lspconfig.nvim", commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245"}

  --Navigation essential
  use {'nvim-telescope/telescope.nvim', commit = "589910694bafe3975d0f025a750dcabc09824126"}
  use {"nvim-telescope/telescope-media-files.nvim", commit = "0826c7a730bc4d36068f7c85cf4c5b3fd9fb570a"}
  use {'ThePrimeagen/harpoon', commit = "1bc17e3e42ea3c46b33c0bbad6a880792692a1b3" }
  use {"chentoast/marks.nvim", commit = "bb25ae3f65f504379e3d08c8a02560b76eaf91e8"}
  use { "stevearc/oil.nvim", commit = "3b7c74798e699633d602823aefd9a4e4e36c02a8"}

  --File specific
  use {"lervag/vimtex", commit = "cf6b84775624582d7422715ee46b0a63b53cee38", config = function() Latex_init()end, }

  --QOF
  use {"kyazdani42/nvim-tree.lua"    , commit = "6709463b2d18e77f7a946027917aa00d4aaed6f4"}
  use {"kyazdani42/nvim-web-devicons", commit = "1020869742ecb191f260818234517f4a1515cfe8"}
  use {"windwp/nvim-autopairs"       , commit = "68f0e5c3dab23261a945272032ee6700af86227a"}
  use {'numToStr/Comment.nvim'       , commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb"}
  -- use {"kylechui/nvim-surround"      , commit = "ae298105122c87bbe0a36b1ad20b06d417c0433e"}
  --
  --Theme and UI
  use {'nvim-treesitter/nvim-treesitter', commit = "f2bd62c6568de54ca1b8fb0a8de04a41442934cb"}
  use {"lewis6991/gitsigns.nvim"        , commit = "4c40357994f386e72be92a46f41fc1664c84c87d"}
  use {"nvim-lualine/lualine.nvim"      , commit = "f4f791f67e70d378a754d02da068231d2352e5bc"}
  use {"xiyaowong/transparent.nvim"     , commit = "8a2749a2fa74f97fe6557f61b89ac7fd873f3c21"}

  --Debugger
  use {'mfussenegger/nvim-dap',
    commit = "6e0e8ab4d8ed520076971465a4388dfe54a91d83",
    requires ={
      {"rcarriga/nvim-dap-ui", commit = "bc81f8d3440aede116f821114547a476b082b319"},
      {"nvim-neotest/nvim-nio", commit = "21f5324bfac14e22ba26553caf69ec76ae8a7662"}
    }
  }

  -- Leetcode intergration(might remove we will see)
  use {"kawre/leetcode.nvim" , commit = "db7e1cd6b9191b34b4c1f2f96e4e3949cde9f951", build = ".TSUpdate html",}
  use {"MunifTanjim/nui.nvim", commit = "53e907ffe5eedebdca1cd503b00aa8692068ca46"}

  -- themes
  use "bjarneo/nes.nvim"




end)
