" The MIT License (MIT)
" 
" Copyright (c) 2015 Minwoo Park <mnncat@gmail.com>
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"

if exists('g:loaded_include')
  finish
endif

let g:loaded_include = 1
let s:cpo_save = &cpo
set cpo&vim

function! cppinclude#include()
  let ln = search('#include', 'bsW')
  if ln == 0
    let ln = search('#define', 'bsW')
    if ln == 0
      let ln = search('#pragma', 'bsW')
      if ln == 0
        let ln = search('//', 'bsW')
        if ln == 0
          execute "normal! gg"
          execute "normal! O#include "
          execute "startinsert!"
          return
        endif
      endif
    endif
  endif
  execute "normal! o#include "
  execute "startinsert!"
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

