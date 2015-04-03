function! JS_CommentToggle () range
	let	comment=1	"
	for line in range( a:firstline, a:lastline  )
		if match( getline(line), '^\/\/' ) == -1	" no comment
			let comment = 0
			break
		endif
	endfor
	if comment == 0
		exe a:firstline.','.a:lastline.'s/^/\/\//'
	else
		exe a:firstline.','.a:lastline.'s/^\/\///'
	endif
endfunction

autocmd FileType javascript  nnoremap <buffer> <silent> <LocalLeader>cc :call JS_CommentToggle()<CR>j
autocmd FileType javascript  vnoremap <buffer> <silent> <LocalLeader>cc :call JS_CommentToggle()<CR>j
