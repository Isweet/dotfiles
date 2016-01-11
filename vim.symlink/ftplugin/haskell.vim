let g:hindent_style = "johan-tibell"

nnoremap <leader>t :VimuxRunCommand("cd $(git rev-parse --show-toplevel) && cabal test --show-details=streaming && cd -")<cr>
