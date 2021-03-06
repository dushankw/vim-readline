" COMMANDS FOR CHANGING TEXT
" http://www.delorie.com/gnu/docs/readline/rlman_16.html

" delete-char (C-d)
" Delete the character at point. If point is at the beginning of the line,
" there are no characters in the line, and the last character typed was not
" bound to delete-char, then return EOF.
function! ReadlineDeleteChar()
  if col(".") == col("$")-1
    call feedkeys("\<Esc>lr i")
  else
    call feedkeys("\<C-O>x")
  endif
endfunction
command! ReadlineDeleteChar call ReadlineDeleteChar()

" backward-delete-char (Rubout)
" Delete the character behind the cursor. A numeric argument means to kill the
" characters instead of deleting them.
" <DEFAULT VIM BEHAVIOUR>

" forward-backward-delete-char ()
" Delete the character under the cursor, unless the cursor is at the end of
" the line, in which case the character behind the cursor is deleted. By
" default, this is not bound to a key.

" quoted-insert (C-q or C-v)
" Add the next character typed to the line verbatim. This is how to insert key
" sequences like C-q, for example.
" <DEFAULT VIM BEHAVIOUR>

" tab-insert (M-TAB)
" Insert a tab character.

" self-insert (a, b, A, 1, !, ...)
" Insert yourself.
" <DEFAULT VIM BEHAVIOUR>

" transpose-chars (C-t)
" Drag the character before the cursor forward over the character at the
" cursor, moving the cursor forward as well. If the insertion point is at the
" end of the line, then this transposes the last two characters of the line.
" Negative arguments have no effect.
function! ReadlineTransposeChars()
  if col(".") == col("$")-1           " When we are at the end of the line
    call feedkeys("\<Left>")
  endif
  call feedkeys("\<Esc>xpa")
endfunction
command! ReadlineTransposeChars call ReadlineTransposeChars()

" transpose-words (M-t)
" Drag the word before point past the word after point, moving point past that
" word as well. If the insertion point is at the end of the line, this
" transposes the last two words on the line.
function! ReadlineTransposeWords()
  call feedkeys("\<Esc>b\"adE\"bxb\"bP\"aPEa")
endfunction
command! ReadlineTransposeWords call ReadlineTransposeWords()

" upcase-word (M-u)
" Uppercase the current (or following) word. With a negative argument,
" uppercase the previous word, but do not move the cursor.
function! ReadlineUpcaseWord()
  call feedkeys("\<Esc>\<C-v>eUea")
endfunction
command! ReadlineUpcaseWord call ReadlineUpcaseWord()

" downcase-word (M-l)
" Lowercase the current (or following) word. With a negative argument,
" lowercase the previous word, but do not move the cursor.
function! ReadlineDowncaseWord()
  call feedkeys("\<Esc>\<C-v>euea")
endfunction
command! ReadlineDowncaseWord call ReadlineDowncaseWord()

" capitalize-word (M-c)
" Capitalize the current (or following) word. With a negative argument,
" capitalize the previous word, but do not move the cursor.
function! ReadlineCapitalizeWord()
  call feedkeys("\<Esc>l~ea")
endfunction
command! ReadlineCapitalizeWord call ReadlineCapitalizeWord()

