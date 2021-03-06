" Author: Bart Libert <bart.libert@gmail.com>
" Description: cppcheck linter for cpp files

if exists('g:loaded_ale_linters_cpp_cppcheck')
    finish
endif

let g:loaded_ale_linters_cpp_cppcheck = 1

" Set this option to change the cppcheck options
if !exists('g:ale_cpp_cppcheck_options')
    let g:ale_cpp_cppcheck_options = '--enable=style'
endif

call ale#linter#Define('cpp', {
\   'name': 'cppcheck',
\   'output_stream': 'both',
\   'executable': 'cppcheck',
\   'command': g:ale#util#stdin_wrapper . ' .cpp cppcheck -q --language=c++ '
\       . g:ale_cpp_cppcheck_options,
\   'callback': 'ale#handlers#HandleCppCheckFormat',
\})
