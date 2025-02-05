{ config, lib, ... }:
{
  plugins.lspkind = {
    enable = true;

    cmp = lib.mkIf config.plugins.cmp.enable {
      enable = true;

      menu = {
        buffer = "";
        calc = "";
        cmdline = "";
        codeium = "󱜙";
        copilot = "";
        emoji = "󰞅";
        git = "";
        luasnip = "󰩫";
        neorg = "";
        nvim_lsp = "";
        nvim_lua = "";
        path = "";
        spell = "";
        treesitter = "󰔱";
        nixpkgs_maintainers = "";
      };
    };
  };
}
