-- noice.nvim cmdline crash was caused by unsigned tree-sitter .so files on macOS.
-- Fixed by re-signing: find ~/.local/share/nvim -name "*.so" | xargs sudo codesign --force --sign -
return {}
