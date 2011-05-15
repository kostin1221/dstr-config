"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Date:						Fri Sep 25 14:29:10 CEST 2009
" Licence:					GPL version 2.0 license
"=============================================================================
let s:id = 666
let s:counter = 0

if !exists('g:phpErrorMarker#autowrite')
	let g:phpErrorMarker#autowrite = 0
endif

if !exists('g:phpErrorMarker#openQuickfix')
	let g:phpErrorMarker#openQuickfix = 1
endif

if !exists('g:phpErrorMarker#automake')
	let g:phpErrorMarker#automake = 0
endif

if !exists('g:phpErrorMarker#php')
	let g:phpErrorMarker#php = 'php'
endif

if !exists('g:phpErrorMarker#errorformat')
	let g:phpErrorMarker#errorformat = '%m\ in\ %f\ on\ line\ %l'
endif

if !exists('g:phpErrorMarker#textError')
	let g:phpErrorMarker#textError = '!!'
endif

if !exists('g:phpErrorMarker#textWarning')
	let phpErrorMarker#textWarning = '!'
endif

highlight default phpErrorMarkerWarning guifg=LightRed ctermfg=lightRed term=underline cterm=underline gui=underline
highlight default phpErrorMarkerError guifg=Red ctermfg=Red term=underline cterm=underline gui=underline

execute 'sign define phpErrorMarkerError text=' . g:phpErrorMarker#textError . ' linehl=phpErrorMarkerError texthl=phpErrorMarkerError'
execute 'sign define phpErrorMarkerWarning text=' . g:phpErrorMarker#textWarning . ' linehl=phpErrorMarkerWarning texthl=phpErrorMarkerWarning'

"automake {{{1
function phpErrorMarker#automake()
	if g:phpErrorMarker#automake
		silent! make
		normal 
	endif
endfunction
"autowrite {{{1
function phpErrorMarker#autowrite()
	if g:phpErrorMarker#autowrite && &modified
		w
	endif
endfunction
"markErrors {{{1
function phpErrorMarker#markErrors()
	call phpErrorMarker#unmarkErrors()

	for error in getqflist()
		if error['valid'] > 0
			let s:counter += 1
			silent! execute 'sign place ' . (s:id + s:counter) . ' line=' . error['lnum'] . ' name=phpErrorMarker' . (error['text']  =~ '\cwarning' ? 'Warning' : 'Error')  . ' buffer=' . error['bufnr']
		endif
	endfor

	if s:counter > 0
		redraw
	endif

	if g:phpErrorMarker#openQuickfix
		cw
	endif
endfunction
"unmarkErrors {{{1
function phpErrorMarker#unmarkErrors()
	if s:counter > 0
		while s:counter > 0
			silent! execute 'sign unplace ' . (s:id + s:counter)
			let s:counter -= 1
		endwhile

		redraw
	endif
endfunction
" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
"makeVimball {{{1
function phpErrorMarker#makeVimball()
	split phpErrorMarkerVimball

	setlocal bufhidden=delete
	setlocal nobuflisted
	setlocal noswapfile

	let files = 0

	for file in split(globpath(&runtimepath, '**/phpErrorMarker*'), "\n")
		for runtimepath in split(&runtimepath, ',')
			if file =~ '^' . runtimepath
				if getftype(file) != 'dir'
					let files += 1
					call setline(files, substitute(file, '^' . runtimepath . '/', '', ''))
				else
					for subFile in split(glob(file . '/**'), "\n")
						if getftype(subFile) != 'dir'
							let files += 1
							call setline(files, substitute(subFile, '^' . runtimepath . '/', '', ''))
						endif
					endfor
				endif
			endif
		endfor
	endfor

	try
		execute '%MkVimball! phpErrorMarker'

		setlocal nomodified
		bwipeout

		echomsg 'Vimball is in ''' . getcwd() . ''''
	catch /.*/
		echohl ErrorMsg
		echomsg v:exception
		echohl None
	endtry
endfunction
" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
