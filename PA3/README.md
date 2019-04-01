# PA3

Dear Prof. Soffa and TAs,



For convenience, you can run `sh test.sh` under `PA3/PA3Start` directory. It would automatically run makefile and test case.

This compiler can create symbol table for all test cases under `PA3/PA3Start/TestPA3/WorkingTest` and do the type checking under `PA3/PA3Start/TestPA3/ErrorTest`. The structure of test files are as follows:

```
├── ErrorTest/
│   ├── PA4doubleDef.java
│   ├── PA4noDef.java
│   ├── PA5dupParam.java
│   └── PA5dupnameserror.java
|   |__ PA3tooManyParams.java
|   |__ PA3varNoDef.java
└── WorkingTest/
    ├── PA4MazeSolver.java
    ├── PA4bluedot.java
    ├── PA4raindrop.java
    ├── PA5RunningExample.java
    ├── PA5movedot.java
    ├── PA5obj.java
    └── expectOutput/

3 directories, 12 files
```



It can do type checking including:

* Number of parameters:

test file PA3tooManyParams.java

.....

[19,14] Method [func1(BYTE,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT,INT)] under scope func1 has too many parameters (at most 12)

++++++++++++++++++++
* Undefined variables:

test file PA3varNoDef.java
....
[21,16] ID [haha] is not in scope setP

++++++++++++++++++++
* Double defined method

test file PA4doubleDef.java
.....
[25,17] Method [setP] is already defined in scope C

++++++++++++++++++++
* Undefined method

test file PA4noDef.java
.....
[14,2] Method [setPix] is not defined under scope C

++++++++++++++++++++
* Duplicate parameter in method

test file PA5dupParam.java
....
[18,14] Formal [a] is already defined in scope myMethod

++++++++++++++++++++
* Duplicate name in method/var/class

test file PA5dupnameserror.java
....
[23,16] Method [A] is already defined in scope A

