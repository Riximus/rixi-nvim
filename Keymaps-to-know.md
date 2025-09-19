W, B, I : Go by word

{, } : Start and end of a block

CTRL-v : Visual Block

V : Visual Line

gv : Highlight last highlighted

gv$A : Write mode at the end of the line (with I at the beginning)

CTRL-u : Moving up the page

CTRL-d : Moving down the page

ciw : Change in word

caw : Change around word

vi" : select in ""

vib : select in ()

viB : select in {}

cib : Change in brackets

cab : Change around word

ci{ : Change in curly brackets

diw : delete inside

diW : delete everything between whitepaces

gcc : comment current line

gc : comment visual block

~ : Capitalize letter

g~w : Captilize word

g~it : Capitalize everything inner tag

ZZ : quick close

ZQ : quick close without saving

gg=G : re-indent the whole file

% : jump between (), [], {} and so on

_insert_ CTRL-j : move to new line

_insert_ CTRL-i : tab

_insert_ CTRL-h : backspace

gx : open url in browser

gf : open file

m<letter> : mark line in file with letter

m<capital letter> : mark line globally with letter

'<letter> : jump to that marked line

<number>G : jump to line number; it's like :<number>

J : join two lines

gJ : no whitespace join two lines

Mode Explanations:

n = Normal mode (default mode, for navigation and commands)
x = Visual mode (when you select text with v, V, or Ctrl+v)
o = Operator-pending mode (after pressing operators like d, c, y)
c = Command-line mode (when you press : to enter commands)
