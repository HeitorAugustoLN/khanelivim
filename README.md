# Khanelivim: My Nix-Powered Neovim Configuration

This is my fully customized Neovim configuration, built with Nix and the
powerful [Nixvim flake](https://github.com/nix-community/nixvim). Enjoy a
consistent, reproducible, and easy-to-manage Neovim environment across different
machines.

![Screenshot of your Neovim setup] (optional)

## Key Features

- **Nixvim for Declarative Configuration:** Leverage Nix expressions for a clean
  and maintainable Neovim setup. Easily add, remove, or update plugins, LSP
  servers, and other components.
- **Consistent Environments:** Reproduce your Neovim setup effortlessly on any
  system with Nix installed.
- **Plugin Management:** Seamlessly manage plugins using Nixvim's declarative
  configuration.
- **LSP Integration:** Built-in support for language servers and completion
  tools.
- **Customization:** Adapt to your preferences with additional plugins, themes,
  and key mappings (details below).

## Prerequisites

- **Nix Package Manager:** Ensure Nix is installed on your system. Follow the
  instructions at
  [https://nixos.org/download.html](https://nixos.org/download.html).

## Installation

**Option 1: Using `nix run` (Easiest):**

```bash
nix run github:khaneliman/khanelivim
```

**Option 2: Adding as a Flake Input:**

In your system's Nix configuration (e.g., ~/.config/nixpkgs/flake.nix or
~/.config/nixpkgs/home.nix), add the following:

```nix
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # Or your preferred channel
      khanelivim.url = "github:khaneliman/khanelivim";
    };

    outputs = { self, nixpkgs, khanelivim }: {
      # ... your other configuration ...

      # Add to your system packages or devShell if you want to make it available system-wide
      packages = with nixpkgs; [
        khanelivim.packages.${system}.default
      ];

      # Or, use in a devShell:
      devShells.default = nixpkgs.mkShell {
        nativeBuildInputs = [ khanelivim.packages.${system}.default ];
      };
    };
```

**Option 3: Build and run locally:**

```bash
nix build . && ./result/bin/nvim
```

## Configuration Highlights

- Plugins:
  - UI/UX Enhancements:
    - bufferline: A buffer line to show open buffers
    - catppuccin: A color theme with a focus on aesthetics
    - lualine: A highly customizable statusline
    - mini.nvim: A collection of minimalist plugins
    - neo-tree: A file explorer
    - noice.nvim: A highly customizable notification system
    - which-key: A popup that displays possible keybindings

  - Git Integration:
    - git-conflict: A plugin to help resolve git conflicts
    - git-worktree: A plugin to help manage git worktrees
    - gitsigns.nvim: A plugin that provides git integration

  - Coding Productivity:
    - cmp: A completion engine
    - codeium: An AI powered autocompletion tool
    - conform.nvim: A formatter
    - dap: A debugger adapter protocol
    - illuminate: A plugin that highlights occurrences of the word under the
      cursor
    - leap: A motion plugin to jump to any word in the visible text
    - lightbulb: A plugin that shows a lightbulb when code actions are available
    - lsp: Language server protocol integration
    - navic: A navigation plugin that uses lsp symbols to provide a breadcrumb
      trail
    - neotest: A test runner
    - nvim-treesitter: A parser for better syntax highlighting and code
      navigation
    - project.nvim: A project management plugin
    - refactoring: A plugin to help with refactoring code
    - telescope: A fuzzy finder
    - trouble.nvim: A diagnostics list

  - Note Taking and Markdown:
    - neorg: A note taking plugin
    - markdown-preview: A plugin to preview markdown files
    - markview: A plugin to view markdown files

  - Other:
    - colorizer: A plugin that shows colors in css, scss, sass, html, and
      javascript files
    - debugprint: A plugin that makes it easier to debug print statements
    - diffview: A plugin to view diffs
    - dirtytalk: A plugin that provides some funny messages
    - efm: A file manager
    - glow.nvim: A markdown previewer
    - harpoon: A plugin to mark and quickly navigate between files
    - hop.nvim: A plugin to quickly jump to any location on the screen
    - indent-blankline.nvim: A plugin that shows indent lines
    - smartcolumn: A plugin to automatically adjust column widths
    - spectre: A search and replace tool
    - statuscol: A plugin to show git status in the sign column
    - todo-comments: A plugin to highlight todo comments
    - toggleterm: A terminal emulator
    - undotree: A plugin to visualize the undo tree
    - wakatime: A plugin that tracks your time spent coding
    - wilder: A fuzzy finder
    - yanky: A clipboard manager
    - yazi: Yet Another Zsh Integration (for zsh shell integration)
  - LSP Servers: [List the languages you have LSP support for]
  - Theme: [Name your theme]
  - Key Mappings: [Describe any important custom key mappings]

For the full configuration details, please explore the flake.nix file in the
repository. Usage

### Updating

```bash
nix flake update
```

### Rebuild your Neovim:

```bash
nix build
```

### Run the updated Neovim:

```bash
./result/bin/nvim
```

## Customization / Contributing

Feel free to fork the repository and modify the flake.nix file to personalize
your Neovim configuration. Contributing

Pull requests are welcome! If you'd like to make improvements, please open an
issue or submit a PR.

### Enter Nix Shell:

```bash
cd ~/.config/nvim nix develop
```

*(If you have direnv installed, it should automatically activate the environment
when you cd into the directory.)
