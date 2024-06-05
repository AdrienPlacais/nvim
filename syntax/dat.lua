vim.cmd [[
" ======================================================================
" TraceWin .dat files
" ======================================================================
" Syntax coloring
if exists("b:current_syntax")
   finish
endif

syntax case ignore

syntax match twElementLength '\d\+'          contained nextgroup=twElementAttr
" Match one or more (\+) digits (\d) followed by a point (\.), and then again
" a digit (\d) (or several, or none: \*)
syntax match twElementLength '\d\+\.\d*'     contained nextgroup=twElementAttr
" Match one or more (\+) digits (\d), then a e (e), then a + or a - ([+-]),
" and then one or several digits
" syntax match twElementLength '\d\+e[+-]\+\d\+' contained nextgroup=twElementAttr
syntax match twElementLength '\d\+e[+-]\d\+' contained nextgroup=twElementAttr

" Match everything up to the end of the line
syntax match twElementAttr '^[^;]\+' contained nextgroup=twComment skipwhite
syntax match twCommandAttr '^[^;]\+' contained nextgroup=twComment skipwhite

syntax match twFieldMapType '\d\+' contained nextgroup=twElementLength skipwhite
syntax match twDiagWeight '(.*)' contained nextgroup=twDiagID skipwhite
syntax match twDiagID '\d\+' contained nextgroup=twElementAttr skipwhite

syntax match twComment /;.*$/

" Keyword commands
syntax keyword twFieldMap FIELD_MAP                                                                                                             nextgroup=twFieldMapType skipwhite
syntax keyword twElements DRIFT QUAD DTL_CEL                                                                                                    nextgroup=twElementLength skipwhite
syntax keyword twCommands SHIFT REPEAT_ELE SUPERPOSE_MAP STEERER ADJUST_STEERER ADJUST_STEERER_BX ADJUST_STEERER_BY SET_BEAM_PHASE_ERROR ADJUST PLOT_DST SET_ADV FREQ FIELD_MAP_PATH SET_SYNC_PHASE                nextgroup=twCommandAttr
syntax keyword twElementsNoLength LATTICE LATTICE_END FREQ MATCH_FAM_PHASE MATCH_FAM_GRAD MIN_PHASE_VARIATION DIAG_POSITION GAP THIN_STEERING APERTURE CHOPPER  nextgroup=twElementAttr
syntax keyword twOptimisation SPACE_CHARGE_COMP MATCH_FAM_GRAD ADJUST ADJUST_STEERER STEERER MATCH_FAM_LFOC                                     nextgroup=twDiagID skipwhite
syntax keyword twDiagnostic DIAG_CURRENT DIAG_DCURRENT DIAG_POSITION DIAG_DPOSITION DIAG_DIVERGENCE DIAG_DDIVERGENCE DIAG_SIZE_FWHM DIAG_SIZE DIAG_SIZEP DIAG_DSIZE__FWHM DIAG_DSIZE DIAG_DSIZE2_FWHM DIAG_DSIZE2 DIAG_DSIZE3 DIAG_DSIZE4 DIAG_DPSIZE2 DIAG_PHASE DIAG_ENERGY DIAG_DENERGY DIAG_DPHASE DIAG_LUMINOSITY DIAG_WAIST DIAG_ACHROMAT DIAG_EMIT DIAG_EMIT_99 DIAG_HALO DIAG_SET_MATRIX DIAG_TWISS DIAG_DTWISS DIAG_DTWISS2 DIAG_SEPARATION DIAG_SIZE_MAX DIAG_SIZE_MIN DIAG_PHASE_ADV DIAG_BETA DIAG_DBETA      nextgroup=twDiagWeight skipwhite
syntax keyword twError ERROR_CAV_NCPL_STAT ERROR_BEAM_STAT ERROR_GAUSSIAN_CUT_OFF ERROR_QUAD_NCPL_STAT ERROR_QUAD_NCPL_DYN ERROR_CAV_NCPL_DYN   nextgroup=twCommandAttr skipwhite


syntax region twAfterEnd start='^ *END' end='\%$'

" FieldMap             skip     FieldMapType   skip           ElementLength        ElementAttr                         Comment
" Elements             skip                                   ElementLength        ElementAttr                         Comment
" Commands                      CommandAttr                                                                            Comment
" ElementsNoLength                                                                 Element Attr                        Comment

" Set colors
hi def link twComment            Comment
hi def link twAfterEnd           Comment
hi def link twCommands           Function
hi def link twElements           Statement
hi def link twElementsNoLength   Statement
hi def link twFieldMap           Statement
hi def link twElementLength      Constant
hi def link twElementAttr        PreProc
hi def link twCommandAttr        PreProc
hi def link twFieldMapType       Statement

hi def link twDiagnostic         String
hi def link twOptimisation       String
hi def link twDiagWeight         Constant
hi def link twDiagID             Special
hi def link twError              PmenuSel

let b:current_syntax = "dat"
]]
