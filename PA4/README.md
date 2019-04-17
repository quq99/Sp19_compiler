# PA4

Dear Prof. Soffa and TAs,

My name is Qian Qu, computing ID is qq8jn.

For convenience, you can run `sh testpa4.sh` under `PA4/` directory. It would automatically run makefile and test case.

This compiler can create AVR code for all test cases under `PA4/TestPA4/WorkingTest`. The structure of test files are as follows:

```
TestPA4
└── WorkingTest
    ├── PA2bluedot.class
    ├── PA2bluedot.java
    ├── PA2bluedot.java.ST.dot
    ├── PA2bluedot.java.ST.txt
    ├── PA2bluedot.java.ast.dot
    ├── PA2bluedot.java.out.txt
    ├── PA2bluedot.java.s
    ├── PA2bluedot.out.txt
    ├── PA3Expressions.class
    ├── PA3Expressions.java
    ├── PA3Expressions.java.ST.txt
    ├── PA3Expressions.java.ast.dot
    ├── PA3Expressions.java.out.txt
    ├── PA3Expressions.java.s
    ├── PA3Expressions.out.txt
    ├── PA3ifdots.class
    ├── PA3ifdots.java
    ├── PA3ifdots.java.ST.txt
    ├── PA3ifdots.java.ast.dot
    ├── PA3ifdots.java.s
    ├── PA3ifdots.out.txt
    ├── expectOutput/
    ├── meggy/
    ├── mjsimPictures/
    └── output.log
```



All the `.out.txt` file means the output by running `java -jar MJSIM.jar -b -f ExampleFile.java.s`. and the expected output is in `expectOutput` directory. I also test the PA3ifdots.java and the output is 

```shell
$ cat TestPA4/WorkingTest/PA3ifdots.out.txt
Checking button Up and returning false
Checking button Down and returning false
```



