
" ┏━┓╻ ╻┏┓ ╻  ┏━┓╻ ╻   ╻ ╻╻┏┳┓
" ┗━┓┣━┫┣┻┓┃  ┣━┫┣━┫   ┃┏┛┃┃┃┃
" ┗━┛╹ ╹┗━┛┗━╸╹ ╹╹ ╹ ╹ ┗┛ ╹╹ ╹
"                           -- by z3bra
" =====================================
"
" A 16 colors scheme that use your terminal colors
set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
        syntax reset
    endif
endif
let g:colors_name="shblah"

" Actual colours and styles.
hi clear SignColumn
hi Boolean                       term=NONE cterm=NONE   ctermfg=10   ctermbg=NONE
hi Character                     term=NONE cterm=NONE   ctermfg=2    ctermbg=NONE
hi ColorColumn                   term=NONE cterm=NONE   ctermfg=NONE ctermbg=NONE
hi Comment                       term=NONE cterm=italic ctermfg=8    ctermbg=NONE
hi Conditional                   term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi Constant                      term=NONE cterm=NONE   ctermfg=6    ctermbg=NONE
hi Cursor                        term=NONE cterm=NONE   ctermfg=7    ctermbg=0
hi CursorLine                    term=NONE cterm=NONE   ctermfg=NONE ctermbg=0
hi CursorLineNr                  term=NONE cterm=NONE   ctermfg=3    ctermbg=0
hi Define                        term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi DiffAdd                       term=NONE cterm=NONE   ctermfg=2    ctermbg=NONE
hi DiffChange                    term=NONE cterm=NONE   ctermfg=4    ctermbg=NONE
hi DiffDelete                    term=NONE cterm=NONE   ctermfg=1    ctermbg=NONE
hi Directory                     term=NONE cterm=NONE   ctermfg=4    ctermbg=NONE
hi Exception                     term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi FoldColumn                    term=NONE cterm=NONE   ctermfg=0    ctermbg=NONE
hi Folded                        term=NONE cterm=NONE   ctermfg=7    ctermbg=0
hi Function                      term=NONE cterm=NONE   ctermfg=4    ctermbg=NONE
hi Include                       term=NONE cterm=NONE   ctermfg=4    ctermbg=NONE
hi Identifier                    term=NONE cterm=NONE   ctermfg=1    ctermbg=NONE
hi Label                         term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi LineNr                        term=NONE cterm=NONE   ctermfg=8    ctermbg=NONE
hi Macro                         term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi NonText                       term=NONE cterm=NONE   ctermfg=0    ctermbg=NONE
hi Normal                        term=NONE cterm=NONE   ctermfg=NONE ctermbg=NONE
hi Operator                      term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi Pmenu                         term=NONE cterm=NONE   ctermfg=7    ctermbg=0
hi PreProc                       term=NONE cterm=NONE   ctermfg=3    ctermbg=NONE
hi Repeat                        term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi Search                        term=NONE cterm=NONE   ctermfg=7    ctermbg=5
hi SignColumn                    term=NONE cterm=NONE   ctermfg=NONE ctermbg=0
hi Special                       term=NONE cterm=NONE   ctermfg=4    ctermbg=NONE
hi Statement                     term=NONE cterm=NONE   ctermfg=5    ctermbg=NONE
hi StatusLine                    term=NONE cterm=NONE   ctermfg=15   ctermbg=0
hi StatusLineNC                  term=NONE cterm=NONE   ctermfg=7    ctermbg=0
hi StorageClass                  term=NONE cterm=NONE   ctermfg=3    ctermbg=NONE
hi String                        term=NONE cterm=NONE   ctermfg=2    ctermbg=NONE
hi TabLineSel                    term=NONE cterm=NONE   ctermfg=7    ctermbg=NONE
hi Todo                          term=NONE cterm=NONE   ctermfg=7    ctermbg=1
hi Type                          term=NONE cterm=NONE   ctermfg=3    ctermbg=NONE
hi VertSplit                     term=NONE cterm=NONE   ctermfg=0    ctermbg=0
hi Visual                        term=NONE cterm=NONE   ctermfg=NONE    ctermbg=0

" General highlighting group links.
hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
hi! link Title           Normal
hi! link LineNr          NonText
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup

" Test the actual colorscheme
syn match Comment      "\"__Comment.*"
syn match Constant     "\"__Constant.*"
syn match Cursor       "\"__Cursor.*"
syn match CursorLine   "\"__CursorLine.*"
syn match DiffAdd      "\"__DiffAdd.*"
syn match DiffChange   "\"__DiffChange.*"
syn match DiffDelete   "\"__DiffDelete.*"
syn match Folded       "\"__Folded.*"
syn match Function     "\"__Function.*"
syn match Identifier   "\"__Identifier.*"
syn match IncSearch    "\"__IncSearch.*"
syn match NonText      "\"__NonText.*"
syn match Normal       "\"__Normal.*"
syn match Pmenu        "\"__Pmenu.*"
syn match PreProc      "\"__PreProc.*"
syn match Search       "\"__Search.*"
syn match Special      "\"__Special.*"
syn match SpecialKey   "\"__SpecialKey.*"
syn match Statement    "\"__Statement.*"
syn match StatusLine   "\"__StatusLine.*"
syn match StatusLineNC "\"__StatusLineNC.*"
syn match String       "\"__String.*"
syn match Todo         "\"__Todo.*"
syn match Type         "\"__Type.*"
syn match VertSplit    "\"__VertSplit.*"
syn match Visual       "\"__Visual.*"

"__Comment              /* this is a comment */
"__Constant             var = SHBLAH
"__Cursor               char under the cursor?
"__CursorLine           Line where the cursor is
"__DiffAdd              +line added from file.orig
"__DiffChange           changed from file.org
"__DiffDelete           -line removed from file.orig
"__Folded               +--- 1 line : Folded line ---
"__Function             function sblah()
"__Identifier           Never ran into that actually...
"__IncSearch            Next search term
"__NonText              This is not a text, move on
"__Normal               Typical text goes like this
"__Pmenu                Currently selected menu item
"__PreProc              #define SHBLAH true
"__Search               This is what you're searching for
"__Special              true false NULL SIGTERM
"__SpecialKey           Never ran into that either
"__Statement            if else return for switch
"__StatusLine           Statusline of current windows
"__StatusLineNC         Statusline of other windows
"__String               "Hello, World!"
"__Todo                 TODO: remove todos from source
"__Type                 int float char void unsigned uint32_t
"__VertSplit            :vsplit will only show ' | '
"__Visual               Selected text looks like this
