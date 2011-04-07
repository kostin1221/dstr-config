"=============================================================================
" Author:					Frédéric Hardy - http://blog.mageekbox.net
" Date:						Fri Sep 25 14:48:22 CEST 2009
" Licence:					GPL version 2.0 license
" GetLatestVimScripts:	2794 11432 :AutoInstall: phpErrorMarker.vim
"=============================================================================
if (!exists('phpErrorMarker#disable') || phpErrorMarker#disable <= 0) && !exists('b:phpErrorMarker_loaded')
	let b:phpErrorMarker_loaded = 1

	if &cp
		echomsg 'No compatible mode is required by phpErrorMarker'
	elseif !has('signs')
		echomsg 'Signs feature is required by phpErrorMarker'
	else
		let s:cpo = &cpo
		setlocal cpo&vim

		let &makeprg = g:phpErrorMarker#php . ' -ln %'
		let &errorformat = g:phpErrorMarker#errorformat

		augroup phpErrorMarker
			au! * <buffer>
			au QuickFixCmdPre <buffer> call phpErrorMarker#autowrite()
			au BufWritePost <buffer> call phpErrorMarker#automake()
			au QuickFixCmdPost <buffer> call phpErrorMarker#markErrors()
		augroup end

		command -buffer MarkPhpErrors call phpErrorMarker#markErrors()
		command -buffer UnmarkPhpErrors call phpErrorMarker#unmarkErrors()
		command -nargs=0 PhpErrorMarkerVimball call phpErrorMarker#makeVimball()

		let &cpo = s:cpo
		unlet s:cpo
	endif
endif

finish

" vim:filetype=vim foldmethod=marker shiftwidth=3 tabstop=3
