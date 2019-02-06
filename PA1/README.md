# PA1

Dear Prof. Soffa and TAs,


  My name is Qian Qu, and computing ID is qq8jn.


I extend mj.lex so that it scans all the tokens specified in the Terminals doc

I test the original test cases by running `regress.sh` in `PA1Start/TestCases` directory, it passed all test cases.

And then I add some test files for tokens, including,

* and.in, and.in.OK : used to test "&&"
* assign.in, assign.in.OK : used to test "="
* brace.in, brace.in.OK : used to test "{" and "}"
* comma.in, comma.in.OK : used to test ","
* err_resrv.in, err_resrv.in.OK : used to test wrong reserve words
* notdef.in, notdef.in.OK : used to test some character that don't define in Terminals doc, give error info
* semi.in, semi.in.OK : used to test ";"
* times.in, times.in.OK : used to test "*"
