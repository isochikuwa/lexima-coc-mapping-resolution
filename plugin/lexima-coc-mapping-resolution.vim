let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_lexima_coc_mapping_resolution')
  finish
endif
let g:loaded_lexima_coc_mapping_resolution = 1

let s:lexima_no_default_rules = get(g:, 'lexima_no_default_rules', 0)
if !s:lexima_no_default_rules
  let g:lexima_no_default_rules = 1
  augroup lexima-coc-mapping-resolution-init
    autocmd!
    autocmd InsertEnter * call lexima#set_default_rules()
          \| execute printf("inoremap <expr><silent> %s coc#pum#visible() ? coc#_select_confirm() : pumvisible() ? \"\\<C-y>\" : lexima#expand(%s, 'i')",
              \ '<CR>',
              \ string(lexima#string#to_mappable('<CR>'))
              \ )
          \| autocmd! lexima-coc-mapping-resolution-init
  augroup End
endif

let &cpo = s:save_cpo
unlet s:save_cpo
