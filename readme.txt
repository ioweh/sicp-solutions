This is my solutions to the sicp course.

The book: https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book.html

To load any file into the interpreter, run the following command:

(load "differentiation.scm")

A more complex example:

(load "C:\\Desktop\\sicp-solutions\\2.5\\generic-arithmetic-operations.scm")

If you run scheme on windows, open the right-click menu of the MIT-GNU Scheme shortcut and choose properties, next edit the Start in option to your likes and preferences.

For the text to be copied from Edwin, set a mark: [Ctrl-spacebar]
Then copy it: [Meta-W]
To paste back from Windows: [Ctrl-Y]

Note that the mit-scheme-9.0.1 doesn't open the files correctly. The version 9.0 works just fine.


Undo in Emacs: C-x u


Find file: C-x C-f 

https://courses.cs.washington.edu/courses/cse341/common/help/mit-scheme.html


To run scheme on Linux, run the `scheme` command and then evaluate `(edit)` command in the intrepreter.

Either way, just run the command `scheme -edwin -edit`.

To increase the font size, edit the `~/.edwin` file and type the following lines there:

((ref-command set-font) "9x15")
((ref-command set-frame-size) 80 64)


