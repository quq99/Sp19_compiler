package ast_visitors;

import java.io.PrintWriter;
import java.util.*;
import ast.visitor.*;
import ast.node.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.File;
import java.io.FileNotFoundException;
import label.Label;
import symtable.ClassSTE;
import symtable.MethodSTE;
import symtable.SymTable;
import symtable.Type;
import symtable.VarSTE;

public class AVRgenVisitor extends DepthFirstVisitor {
  private PrintWriter out;
  private SymTable ST;

  /** Constructor takes a PrintWriter, and stores in instance var. */
  public AVRgenVisitor(PrintWriter out, SymTable ST) {
    this.out = out;
    this.ST = ST;
  }

  private void write2File(String s) {
    this.out.print(s);
  }

  private boolean isByte(Type t) {
    return t == Type.BYTE;
  }

  private boolean isInt(Type t) {
    return t == Type.INT;
  }

  private Type getType(Node node) {
    return this.ST.getExpType(node);
  }
  
  private void setType(Node node, Type t) {
    this.ST.setExpType(node, t);
  }
  
  private void dumpWarning(int line, int pos, String msg) {
    if (msg != null) {
      System.out.println("[" + line + "," + pos + "]: Warning: " + msg);
    }
  }

  private String int2String(int val) {
    return String.valueOf(val);
  }

  // promote Byte to Int if possible
  private void promoteByte2Int(Node n) {
    if (isByte(getType(n))) {
      // dumpWarning(n.getLine(), n.getPos(), "Promoting a BYTE to INT...");
      /**
       * | lower bits  | 
       * | higher bits |
       */
      String negBranch = new Label().toString();
      String storeResult = new Label().toString();
      String negBranch2 = new Label().toString();
      String storeResult2 = new Label().toString();
      write2File(
        //"\n\n    ## This is a auto typecast: promote Byte to Int" + 
        "\n    # load a one byte expression off stack" + 
        "\n    pop    r18" + 
        "\n    # load a one byte expression off stack" +
        "\n    pop    r24" + // # pop byte as the lower bits" + 
        "\n    # promoting a byte to an int" +
        "\n    tst     r24" +
        "\n    brlt     " + negBranch +
        "\n    ldi    r25, 0" + 
        "\n    jmp    " + storeResult +
        "\n" + negBranch + ":" +
        "\n    ldi    r25, hi8(-1)" +
        "\n" + storeResult + ":" +
        "\n    # promoting a byte to an int" +
        "\n    tst     r18" +
        "\n    brlt     " + negBranch2 +
        "\n    ldi    r19, 0" + 
        "\n    jmp    " + storeResult2 +
        "\n" + negBranch2 + ":" +
        "\n    ldi    r19, hi8(-1)" +
        "\n" + storeResult2 + ":"

        //"\n    push   r25" + 
        //"\n    push   r24"
      );
    }
  }

  private void promoteByte2Int2(Node l, Node r) {
    //if (isByte(getType(n))) {
      // dumpWarning(n.getLine(), n.getPos(), "Promoting a BYTE to INT...");
      /**
       * | lower bits  | 
       * | higher bits |
       */
      
      if (isByte(getType(r))) {
        String negBranch = new Label().toString();
        String storeResult = new Label().toString();
        write2File(
          //"\n\n    ## This is a auto typecast: promote Byte to Int" + 
          "\n    # load a one byte expression off stack" + 
          "\n    pop    r18" + 
          "\n    # load a two byte expression off stack" +
          "\n    pop    r24" + // # pop byte as the lower bits" + 
          "\n    pop    r25" +
          "\n    # promoting a byte to an int" +
          "\n    tst     r18" +
          "\n    brlt     " + negBranch +
          "\n    ldi    r19, 0" + 
          "\n    jmp    " + storeResult +
          "\n" + negBranch + ":" +
          "\n    ldi    r19, hi8(-1)" +
          "\n" + storeResult + ":"

          //"\n    push   r25" + 
          //"\n    push   r24"
        );
      }
      else if (isByte(getType(l))) {
        String negBranch = new Label().toString();
        String storeResult = new Label().toString();
        write2File(
          //"\n\n    ## This is a auto typecast: promote Byte to Int" + 
          "\n    # load a two byte expression off stack" + 
          "\n    pop    r18" + 
          "\n    pop    r19" +
          "\n    # load a one byte expression off stack" +
          "\n    pop    r24" + // # pop byte as the lower bits" + 
          "\n    # promoting a byte to an int" +
          "\n    tst     r24" +
          "\n    brlt     " + negBranch +
          "\n    ldi    r25, 0" + 
          "\n    jmp    " + storeResult +
          "\n" + negBranch + ":" +
          "\n    ldi    r25, hi8(-1)" +
          "\n" + storeResult + ":"

          //"\n    push   r25" + 
          //"\n    push   r24"
        );
      }
  }

  private void promoteTo2Bytes() {
    String negBranch = new Label().toString();
    String storeResult = new Label().toString();
    write2File(
      "\n\n    ## This is a auto typecast: promote Byte to Int" + 
      "\n    pop    r24" + // # pop byte as the lower bits" + 
      "\n    tst     r24" +
      "\n    brlt     " + negBranch +
      "\n    ldi    r25,0" + 
      "\n    jmp    " + storeResult +
      "\n" + negBranch + ": " +
      "\n    ldi    r25, hi8(-1)" +
      "\n" + storeResult + ": " +
      "\n    push   r25" + 
      "\n    push   r24"
    );
  }

  private void demoteInt2Byte(Node n) {
    if (isInt(getType(n))) {
      dumpWarning(n.getLine(), n.getPos(), "Demoting a INT to BYTE, may lose precision here...");
      write2File(
        "\n\n    ## This is a auto typecast: demote Int to Byte" +
        "\n    # 2 bytes off stack and only pushing low order bits" +
        "\n    # back on.  Low order bits are on top of stack." +
        "\n    pop    r24" + // # pop lower bits" +
        "\n    pop    r25" + // # pop higher bits" +
        "\n    push   r24" + // # push lower bits back 
        "\n"
      );
    }
  }

  @Override
  public void inAndExp(AndExp node) {
    write2File(
      "\n    #### short-circuited && operation" +
      "\n    # &&: left operand"
    );
  }

  @Override
  public void visitAndExp(AndExp node) {
    inAndExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
    }
    // if the first expr is false, no need to eval the second expr
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    write2File(
      "\n    ldi    r24,1" + 
      "\n    pop    r25" + 
      "\n    cp     r24,r25" +
      "\n    brne     " + falseBranch +// " # if the left expr is false" + 
      "\n\n" + trueBranch + ":" + // # if left expr is true" + 
      "\n    # &&: right operand"
    );
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
    }
    write2File(
      "\n    jmp    " + nextBlock +
      "\n\n" + falseBranch + ":" + // # false branch" + 
      "\n    ldi    r24,0" + 
      "\n    push   r24" + // # push false on stack" +
      "\n\n" + nextBlock + ": "
    );
    outAndExp(node);
  }

  @Override
  public void visitAssignStatement(AssignStatement node) {
    write2File(
      "\n\n    ### AssignStatement" + 
      "\n    # eval rhs exp");
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    if (getType(node.getExp()).getAVRTypeSize() == 1) {
      write2File(
        "\n    # load rhs exp" + 
        "\n    pop    r24"
      );
      VarSTE varSTE = (VarSTE)ST.lookupOther(node.getId(), "var");
      if (varSTE.getBase() == SymTable.classVarBase) {
        write2File(
          "\n    # loading the implicit \"this\"" + 
          "\n    ldd    r31,Y + 2" + 
          "\n    ldd    r30,Y + 1"
        );
      }
      write2File(
        "\n    # store rhs into var " + node.getId() + 
        "\n    std " + varSTE.getBase() + " + " + int2String(varSTE.getOffset()) + ",r24"
      );
    } else { // 2
      write2File(
        "\n    # load rhs exp" + 
        "\n    pop    r24" + 
        "\n    pop    r25"
      );
      VarSTE varSTE = (VarSTE)ST.lookupOther(node.getId(),"var");
      if (varSTE.getBase() == SymTable.classVarBase) {
        write2File(
          "\n    # loading the implicit \"this\"" + 
          "\n    ldd    r31,Y + 2" + 
          "\n    ldd    r30,Y + 1"
        );
      }
      write2File(
        "\n    # store rhs into var " + node.getId() + 
        "\n    std " + varSTE.getBase() + " + " + int2String(varSTE.getOffset() + 1) + ",r25" + 
        "\n    std " + varSTE.getBase() + " + " + int2String(varSTE.getOffset()) + ",r24"
      );
    }
  }

  @Override
  public void outButtonExp(ButtonLiteral node) {
    write2File(
      "\n    # push " + node.getLexeme() + 
      "\n    ldi    r24," + node.getIntValue() +
      "\n    push   r24"
    );
  }

  @Override
  public void outByteCast(ByteCast node) {
    // if it's already byte, do nothing
    if (node != null && !isByte(getType(node.getExp()))) {
      write2File(
        "\n\n    # Casting int to byte by popping" +
        "\n    # 2 bytes off stack and only pushing low order bits" +
        "\n    # back on.  Low order bits are on top of stack." +
        "\n    pop    r24" + // # pop lower bits" +
        "\n    pop    r25" + // # pop higher bits" +
        "\n    push   r24"  // # push lower bits back 
        //"\n"
      );
    }
  }

  @Override
  public void outCallExp(CallExp node) {
    genFuncCall(node);
    handleReturn(getType(node));
  }

  @Override
  public void outCallStatement(CallStatement node){
    genFuncCall(node);
  }

  private void genFuncCall(FuncCall node) {
    write2File(
      "\n\n    #### function call" + 
      "\n    # put parameter values into appropriate registers"
    );
    int argsNum = node.getArgs().size();
    int reg = 26 - (argsNum + 1) * 2; // include this pointer
    // Iterate in reverse.
    ListIterator<IExp> argIter = node.getArgs().listIterator(node.getArgs().size());
    while(argIter.hasPrevious()) {
      IExp arg = argIter.previous();
      if (getType(arg).getAVRTypeSize() == 2) {
        write2File(
          "\n    # load a two bytes expression off stack" + 
          "\n    pop    r" + int2String(reg) + 
          "\n    pop    r" + int2String(reg + 1)
        );
      } else { // size == 1
        write2File(
          "\n    # load a one byte expression off stack" + 
          "\n    pop    r" + int2String(reg)
        );
      }
      reg += 2;
    }
    String methodName = getType(node.getExp()).toString() + "_" + node.getId();
    write2File(
      "\n    # receiver will be passed as first param" + 
      "\n    # load a two byte expression off stack" + 
      "\n    pop    r" + int2String(reg) + 
      "\n    pop    r" + int2String(reg + 1) + 
      "\n    call " + methodName
    );
  }

  private void handleReturn(Type t) {
    int size = t.getAVRTypeSize();
    write2File("\n    # handle return value");
    if (size == 0) {
      write2File("\n    # no return value");
    } else if (size == 2) {
      write2File(
        "\n    # push two byte expression onto stack" + 
        "\n    push   r25" + 
        "\n    push   r24\n"
      );
    } else {
      write2File(
        "\n    # push one byte expression onto stack" + 
        "\n    push   r24\n"
      );
    }
  }

  @Override
  public void inColorExp(ColorLiteral node) {
     write2File(
        "\n\n    # Color expression " + node.getLexeme() + 
        "\n    ldi    r22," + node.getIntValue() + 
        "\n    # push one byte expression onto stack" +
        "\n    push   r22\n");
  }

  @Override
  public void inEqualExp(EqualExp node) {
    defaultIn(node);
     write2File("\n    # start equality check");
  }

  @Override
  public void outEqualExp(EqualExp node) {
    // Convert everything to Int and compare
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    if (getType(node.getRExp()).getAVRTypeSize() == 1) {
      promoteTo2Bytes();
    }

    write2File(
      "\n    # right operand of ==" +
      "\n    pop    r18" + 
      "\n    pop    r19"
    );

    if (getType(node.getLExp()).getAVRTypeSize() == 1) {
      promoteTo2Bytes();
    }

    write2File(
      "\n    # left operand of ==" +
      "\n    pop    r24" + 
      "\n    pop    r25"
    );

    write2File(
      "\n    # compare the operands" +
      "\n    cp     r24,r18" + 
      "\n    cpc    r25,r19" + 
      "\n    breq     " + trueBranch + //" # goto true branch" + 
      "\n" + falseBranch + ":" + // # false branch" + 
      "\n    ldi    r24,0" + 
      "\n    jmp    " + nextBlock + 
      "\n" + trueBranch + ":" + // # true branch" + 
      "\n    ldi    r24,1" +
      "\n" + nextBlock + ": " +
      "\n    push   r24" // # push the result on stack"
    );
  }

  @Override
  public void inFalseExp(FalseLiteral node) {
    write2File(
      "\n    # False/0 expression" +
      "\n    ldi    r22,0" +
      "\n    # push one byte expression onto stack" +
      "\n    push   r22"
    );
  }

  @Override
  public void outIdLiteral(IdLiteral node) {
    write2File(
      "\n    # IdExp" + 
      "\n    # load value for variable " + node.getLexeme()
    );
    VarSTE varSTE = (VarSTE)(ST.lookup(node.getLexeme()));
    int size = varSTE.getSize();
    if (varSTE.getBase() == SymTable.classVarBase) {
      write2File(
        "\n    # loading the implicit \"this\"" + 
        "\n    ldd    r31,Y + 2" + 
        "\n    ldd    r30,Y + 1"
      );
    }
    if (size == 1) {
      write2File(
        "\n    # load a one byte variable from base+offset" + 
        "\n    ldd    r24," + varSTE.getBase() + " + " + int2String(varSTE.getOffset()) + 
        "\n    # push one byte expression onto stack" + 
        "\n    push   r24"
      );
    } else { // only 1 and 2
      write2File(
        "\n    # load a two byte variable from base+offset" +
        "\n    ldd    r25," + varSTE.getBase() + " + " + int2String(varSTE.getOffset() + 1) +
        "\n    ldd    r24," + varSTE.getBase() + " + " + int2String(varSTE.getOffset()) + 
        "\n    # push two byte expression onto stack" +
        "\n    push   r25" +
        "\n    push   r24"
      );
    }
  }

  @Override
  public void inIfStatement(IfStatement node) {
    write2File("\n    #### if statement");
  }

  @Override
  public void visitIfStatement(IfStatement node) {
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String compareBranch = new Label().toString();
    String thenBranch = new Label().toString();
    String elseBranch = new Label().toString();
    String nextBlock = new Label().toString();
    inIfStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    write2File(
      "\n    ldi    r24,1" +
      "\n    pop    r25" +
      "\n    cp     r24,r25" + 
      "\n    breq     " + trueBranch +
      "\n\n" + falseBranch + ":" + // # false branch" +
      "\n    ldi    r24,0" +
      "\n    jmp    " + compareBranch +
      "\n\n" + trueBranch + ":" + // # true branch" +
      "\n    ldi    r24,1" +
      "\n\n" + compareBranch + ":" + // # get comparison result" +
      "\n    # push comparison result onto stack" +
      "\n    push   r24" +
      "\n    # load condition and branch if false" +
      "\n    # load a one byte expression off stack" +
      "\n    pop    r24" +
      "\n    # load one into reg" +
      "\n    ldi    r25,1" +
      "\n    # use cp to set SREG" +
      "\n    cp     r24,r25" +
      "\n    breq     " + thenBranch +
      "\n    jmp    " + elseBranch +
      "\n\n" + thenBranch + ":"  // # then branch"
      );
    if (node.getThenStatement() != null) {
      node.getThenStatement().accept(this);
    }
    write2File(
      "\n    jmp    " + nextBlock + // # jump over the else branch" +
      "\n\n" + elseBranch + ":"  // # else branch"
      );
    if (node.getElseStatement() != null) {
      node.getElseStatement().accept(this);
    }
    outIfStatement(node);
    write2File("\n" + nextBlock + ": ");
  }

  @Override
  public void inIntegerExp(IntLiteral node) {
    write2File(
      "\n\n    # Load constant int " + node.getIntValue() + 
      "\n    ldi    r24,lo8(" + node.getIntValue() + ")" + 
      "\n    ldi    r25,hi8(" + node.getIntValue() + ")" + 
      "\n    # push two byte expression onto stack" +
      "\n    push   r25" + // # higher bits" +
      "\n    push   r24"  // # lower bits
      //"\n"
    );
  }

  @Override
  public void visitLtExp(LtExp node) { // INT to INT
      inLtExp(node);
      if(node.getLExp() != null)
      {
          node.getLExp().accept(this);
      }
      promoteByte2Int(node.getLExp());
      if(node.getRExp() != null)
      {
          node.getRExp().accept(this);
      }
      promoteByte2Int(node.getRExp());
      String trueBranch = new Label().toString();
      String falseBranch = new Label().toString();
      String thenBranch = new Label().toString();
      write2File(
        "\n    # less than expression" +
        "\n    # load a two byte expression off stack" +
        "\n    pop    r18" +
        "\n    pop    r19" +
        "\n    # load a two byte expression off stack" +
        "\n    pop    r24" +
        "\n    pop    r25" +
        "\n    cp     r24,r18" +
        "\n    cpc    r25,r19" +
        "\n    brlt     " + trueBranch +
        "\n" + falseBranch + ":" + // # load false" + 
        "\n    ldi    r24,0" +
        "\n    jmp    " + thenBranch +
        "\n" + trueBranch + ":" + // # load true" +
        "\n    ldi    r24,1" + 
        "\n" + thenBranch + ": " +
        "\n    push   r24"// # push the result of less than"
      );
  }

  @Override
  public void inMainClass(MainClass node) {
    ST.pushScope(ST.lookup(node.getName()).getScope());
  }

  @Override
  public void outMainClass(MainClass node) {
    ST.popScope();
    writeEpilog();
  }

  private void writeEpilog() {
    InputStream mainPrologue = null;
    BufferedReader reader = null;
    try {
      System.out.println("Generate epilog using avrF.rtl.s");
      mainPrologue = this.getClass().getClassLoader().getResourceAsStream("avrF.rtl.s");
      reader = new BufferedReader(new InputStreamReader(mainPrologue));
      String line = null;
      this.out.println();
      while ((line = reader.readLine()) != null) {
         this.out.println(line);
      }
    } catch (Exception e2) {
      e2.printStackTrace();
    } finally {
      try {
        if (mainPrologue != null)
          mainPrologue.close();
        if (reader != null)
          reader.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    this.out.flush(); // write all the buffer to file.
  }

  @Override
  public void outMeggyCheckButton(MeggyCheckButton node) {
    String trueBranch = new Label().toString();
    String falseBranch = new Label().toString();
    String resultBranch = new Label().toString();
    ButtonLiteral b = (ButtonLiteral) node.getExp(); 
    String lexeme = b.getLexeme(); // e.g. Meggy.Button.Down
    int idx = lexeme.lastIndexOf('.') + 1;
    // desired format: Button_Left
    String avrButton = "Button_" + lexeme.substring(idx);
    write2File(
      "\n    pop    r25" + // # get button literal" + 
      "\n    ### MeggyCheckButton" +
      "\n    call   _Z16CheckButtonsDownv" +
      "\n    lds    r24," + avrButton +
      "\n    # if button value is zero, push 0 else push 1" +
      "\n    tst     r24" + // # Test for Zero or Minus" + 
      "\n    breq     " + falseBranch + //" # goto false branch" + 
      "\n" + trueBranch + ":" + //" # if true" + 
      "\n    ldi    r24,1" + 
      "\n    jmp    " + resultBranch + 
      "\n" + falseBranch+ ":" + //" # false branch, r24 is already 0, do nothing" +  
      "\n" + resultBranch + ":" + 
      "\n    " + "push   r24"
    );
  }

  @Override
  public void inMeggyDelay(MeggyDelay node) {
    defaultIn(node);
  }

  @Override
  public void visitMeggyDelay(MeggyDelay node) {
    inMeggyDelay(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
      promoteByte2Int(node.getExp());
    }
    outMeggyDelay(node);
  }

  @Override
  public void outMeggyDelay(MeggyDelay node) {
    write2File(
      "\n    ### Meggy.delay() call" +
      "\n    # load delay parameter" +
      "\n    # load a two byte expression off stack" +
      "\n    pop    r24" +
      "\n    pop    r25" +
      "\n    call   _Z8delay_msj"
    );
  }

  @Override
  public void visitMeggyGetPixel(MeggyGetPixel node) {
    inMeggyGetPixel(node);
    if (node.getXExp() != null) {
      node.getXExp().accept(this);
      demoteInt2Byte(node.getXExp());
    }

    if (node.getYExp() != null) {
      node.getYExp().accept(this);
      demoteInt2Byte(node.getYExp());
    }

    outMeggyGetPixel(node);
  }

  @Override
  public void outMeggyGetPixel(MeggyGetPixel node) {
    write2File(
      "\n    ### Meggy.getPixel(x,y) call" +
      "\n    # load a one byte expression off stack" +
      "\n    pop    r22" +
      "\n    # load a one byte expression off stack" +
      "\n    pop    r24" +
      "\n    call   _Z6ReadPxhh" +
      "\n    # push one byte expression onto stack" +
      "\n    push   r24");
  }

  @Override
  public void visitMeggySetPixel(MeggySetPixel node) {
    inMeggySetPixel(node);
    if (node.getXExp() != null) {
      node.getXExp().accept(this);
      demoteInt2Byte(node.getXExp());
    }
    
    if (node.getYExp() != null) {
      node.getYExp().accept(this);
      demoteInt2Byte(node.getYExp());
    }
    
    if (node.getColor() != null) {
      node.getColor().accept(this);
    }
    outMeggySetPixel(node);
  }

  @Override
  public void outMeggySetPixel(MeggySetPixel node) {
     write2File(
        "\n    ### Meggy.setPixel(x,y,color) call" + 
        "\n    # load a one byte expression off stack" + 
        "\n    pop    r20" + 
        "\n    # load a one byte expression off stack" + 
        "\n    pop    r22" + 
        "\n    # load a one byte expression off stack" + 
        "\n    pop    r24" + 
        "\n    call   _Z6DrawPxhhh" + 
        "\n    call   _Z12DisplaySlatev");
  }

  @Override
  public void visitMeggyToneStart(MeggyToneStart node) {
    inMeggyToneStart(node);
    if (node.getToneExp() != null) {
      node.getToneExp().accept(this);
    }

    if (node.getDurationExp() != null) {
      node.getDurationExp().accept(this);
      promoteByte2Int(node.getDurationExp());
    }
    outMeggyToneStart(node);
  }

  @Override
  public void outMeggyToneStart(MeggyToneStart node) {
    write2File(
      "\n\n    ### Meggy.toneStart(tone, time_ms) call" + 
      "\n    # load a two byte expression off stack" + 
      "\n    pop    r22" + 
      "\n    pop    r23" + 
      "\n    # load a two byte expression off stack" + 
      "\n    pop    r24" + 
      "\n    pop    r25" + 
      "\n    call   _Z10Tone_Startjj"
    );
  }

  

  @Override
  public void visitMinusExp(MinusExp node) {
    inMinusExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      //promoteByte2Int(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      //promoteByte2Int(node.getRExp());
    }
    if (isByte(getType(node.getRExp())) &&
      isByte(getType(node.getLExp()))) {
      promoteByte2Int(node.getRExp());
    }
    else {
      if (isByte(getType(node.getRExp())) ||
        isByte(getType(node.getLExp())))
        promoteByte2Int2(node.getLExp(), node.getRExp());
      //if (isByte(getType(node.getRExp()))) promoteByte2Int2(node.getLExp());
      //if (isByte(getType(node.getLExp()))) promoteByte2Int2(node.getRExp());
    }
    if (isByte(getType(node.getRExp())) ||
      isByte(getType(node.getLExp()))) {
      outMinusExp2(node);
    }
    else {
      outMinusExp(node);
    }
    
  }

  @Override
  public void outMinusExp(MinusExp node) {
    write2File(
      //"\n\n    # x = x - y" + 
      "\n    # load a two byte expression off stack" + 
      "\n    pop    r18" + // # lower bits of y" +
      "\n    pop    r19" + // # higher bits of y" +
      "\n    # load a two byte expression off stack" + 
      "\n    pop    r24" + // # lower bits of x" +
      "\n    pop    r25\n" + // # higher bits of x" +
      "\n    # Do INT sub operation" +
      "\n    sub    r24, r18" +
      "\n    sbc    r25, r19" +
      "\n    # push hi order byte first" +
      "\n    # push two byte expression onto stack" +
      "\n    push   r25" + // # higher bits" +
      "\n    push   r24"// # lower bits"
      );
  }

  public void outMinusExp2(MinusExp node) {
    write2File(
      "\n\n    # Do INT sub operation" +
      "\n    sub    r24, r18" +
      "\n    sbc    r25, r19" +
      "\n    # push hi order byte first" +
      "\n    # push two byte expression onto stack" +
      "\n    push   r25" + // # higher bits" +
      "\n    push   r24"// # lower bits"
      );
  }

  @Override
  public void visitMulExp(MulExp node) {
    inMulExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      demoteInt2Byte(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      demoteInt2Byte(node.getRExp());
    }
    outMulExp(node);
  }

  @Override
  public void outMulExp(MulExp node) {
    write2File(
      "\n\n    # MulExp" + 
      "\n    # load a one byte expression off stack" + 
      "\n    pop    r18" + 
      "\n    # load a one byte expression off stack" + 
      "\n    pop    r22" + 
      "\n    # move low byte src into dest reg" + 
      "\n    mov    r24, r18" + 
      "\n    # move low byte src into dest reg" + 
      "\n    mov    r26, r22\n" + 
      "\n    # Do mul operation of two input bytes" + 
      "\n    muls   r24, r26" + 
      "\n    # push two byte expression onto stack" + 
      "\n    push   r1" + 
      "\n    push   r0" + 
      "\n    # clear r0 and r1, thanks Brendan!" + 
      "\n    eor    r0,r0" + 
      "\n    eor    r1,r1"
    );
  }

  @Override
  public void outNewExp(NewExp node) {
    int size = ST.lookup(node.getId()).getSize();
    write2File(
      "\n    # NewExp" +
      "\n    ldi    r24,lo8(" + int2String(size) + ")" + 
      "\n    ldi    r25,hi8(" + int2String(size) + ")" + 
      "\n    # allocating object of size 0 on heap" +
      "\n    call malloc" +
      "\n    # push object address" +
      "\n    # push two byte expression onto stack" +
      "\n    push   r25" +
      "\n    push   r24"
    );
  }

  @Override
  public void visitNegExp(NegExp node) {
    inNegExp(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    outNegExp(node);
  }

  @Override
  public void outNegExp(NegExp node) {
    
    if (isByte(getType(node.getExp()))) {
      String negBranch = new Label().toString();
      String thenBranch = new Label().toString();
      write2File(
        "\n\n    # neg byte" +
        "\n    # load a one byte expression off stack" +
        "\n    pop    r24" +
        "\n    # promoting a byte to an int" +
        "\n    tst     r24" +
        "\n    brlt     " + negBranch +
        "\n    ldi    r25,0" +
        "\n    jmp    " + thenBranch +
        "\n" + negBranch + ": " +
        "\n    ldi    r25, hi8(-1)" +
        "\n" + thenBranch + ": " +
        "\n    ldi     r22, 0" +
        "\n    ldi     r23, 0" +
        "\n    sub     r22, r24" +
        "\n    sbc     r23, r25" +
        "\n    # pushtwo byte expression onto stack" +
        "\n    push   r23" +
        "\n    push   r22"
      );
    } else { // Int
      write2File(
        "\n\n    # neg int" +
        "\n    # load a two byte expression off stack" +
        "\n    pop    r24" +
        "\n    pop    r25" +
        "\n    ldi     r22, 0" +
        "\n    ldi     r23, 0" +
        "\n    sub     r22, r24" +
        "\n    sbc     r23, r25" +
        "\n    # push two byte expression onto stack" +
        "\n    push   r23" +
        "\n    push   r22"
      );
    }
  }

  @Override
  public void outNotExp(NotExp node) {
    write2File(
      "\n    # not operation" +
      "\n    # load a one byte expression off stack" +
      "\n    pop    r24" +
      "\n    ldi    r22,1" +
      "\n    eor    r24,r22" + // # xor" +
      "\n    # push the result onto stack" +
      "\n    push   r24"
    );
  }

  @Override
  public void inPlusExp(PlusExp node) {
     //write2File("\n    # start a add operation");
  }

  @Override
  public void visitPlusExp(PlusExp node) {
    inPlusExp(node);
    if (node.getLExp() != null) {
      node.getLExp().accept(this);
      //promoteByte2Int(node.getLExp());
    }
    if (node.getRExp() != null) {
      node.getRExp().accept(this);
      //promoteByte2Int(node.getRExp());
    }
    if (isByte(getType(node.getRExp())) &&
      isByte(getType(node.getLExp()))) {
      promoteByte2Int(node.getRExp());
    }
    else {
      if (isByte(getType(node.getRExp())) ||
        isByte(getType(node.getLExp())))
        promoteByte2Int2(node.getLExp(), node.getRExp());
      //if (isByte(getType(node.getRExp()))) promoteByte2Int2(node.getLExp());
      //if (isByte(getType(node.getLExp()))) promoteByte2Int2(node.getRExp());
    }
    if (isByte(getType(node.getRExp())) ||
      isByte(getType(node.getLExp()))) {
      outPlusExp2(node);
    }
    else {
      outPlusExp(node);
    }
  }

  @Override
  public void outPlusExp(PlusExp node) {
     write2File(
        "\n    # load a two byte expression off stack" + 
        "\n    pop    r18" + 
        "\n    pop    r19" + 
        "\n    # load a two byte expression off stack" + 
        "\n    pop    r24" +
        "\n    pop    r25\n" +
        "\n    # Do add operation" +
        "\n    add    r24, r18" +
        "\n    adc    r25, r19" +
        "\n    # push two byte expression onto stack" +
        "\n    push   r25" +
        "\n    push   r24");
  }

  public void outPlusExp2(PlusExp node) {
     write2File(
        "\n\n    # Do add operation" +
        "\n    add    r24, r18" +
        "\n    adc    r25, r19" +
        "\n    # push two byte expression onto stack" +
        "\n    push   r25" +
        "\n    push   r24");
  }

  @Override
  public void inProgram(Program node) {
    InputStream mainPrologue = null;
    BufferedReader reader = null;
    try {
      // The syntax for loading a text resource file
      // from a jar file here:
      // http://www.rgagnon.com/javadetails/java-0077.html
      System.out.println("Generate prolog using avrH.rtl.s");
      mainPrologue = this.getClass().getClassLoader().getResourceAsStream("avrH.rtl.s");
      reader = new BufferedReader(new InputStreamReader(mainPrologue));
      String line = null;
      while ((line = reader.readLine()) != null) {
        this.out.println(line);
      }
      //this.out.print("\n");
    } catch (Exception e2) {
      e2.printStackTrace();
    } finally {
      try {
        if (mainPrologue != null)
          mainPrologue.close();
        if (reader != null)
          reader.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  @Override
  public void outProgram(Program node) {
    this.out.flush();
  }

  @Override
  public void outThisExp(ThisLiteral node) {
    String sym = node.getLexeme();
    if (sym.equals("this")){
      sym = "THIS";
    }
    //System.out.println(sym);
    VarSTE thisSTE = (VarSTE)(ST.lookupInnermost(sym));
    //if (thisSTE == null) {
    //  System.out.println("hhh, thisste null!!!!!");
    //  System.out.println(node.getLexeme());
    //}
    write2File(
      "\n    # loading the implicit \"this\"" +
      "\n    # load a two byte variable from base+offset" +
      "\n    ldd    r31," + thisSTE.getBase() + " + " + int2String(thisSTE.getOffset() + 1) + 
      "\n    ldd    r30," + thisSTE.getBase() + " + " + int2String(thisSTE.getOffset()) + 
      "\n    # push two byte expression onto stack" +
      "\n    push   r31" +
      "\n    push   r30"
    );
  }

  @Override
  public void outToneExp(ToneLiteral node) {
    write2File(
      "\n\n    # Push" + node.getLexeme() + " onto the stack." + 
      "\n    ldi    r25,hi8(" + node.getIntValue() + ")" +
      "\n    ldi    r24,lo8(" + node.getIntValue() + ")" + 
      "\n    # push two byte expression onto stack" + 
      "\n    push   r25" + 
      "\n    push   r24"
    );
  }

  @Override
  public void inTopClassDecl(TopClassDecl node) {
    assert(ST.getCurrentScope() == ST.getGlobalScope());
    ST.pushScope(ST.lookup(node.getName()).getScope());
  }

  @Override
  public void outTopClassDecl(TopClassDecl node) {
    ST.popScope();
    assert(ST.getCurrentScope() == ST.getGlobalScope());
  }

  @Override
  public void inTrueExp(TrueLiteral node) {
    write2File(
      "\n    # True/1 expression" +
      "\n    ldi    r22,lo8(1)" +
      "\n    # push one byte expression onto stack" +
      "\n    push   r22"
    );
  }
  
  @Override
  public void inWhileStatement(WhileStatement node) {
    write2File(
      "\n\n    ### start of while loop"
    );
  }

  @Override
  public void visitWhileStatement(WhileStatement node) {
    String cond = new Label().toString();
    String body = new Label().toString();
    String nextBlock = new Label().toString();
    inWhileStatement(node);
    write2File(
      "\n" + cond + ":" // # while loop condition"
    );
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    write2File(
      "\n    # examine condition" +
      "\n    # load a one byte expression off stack" +
      "\n    pop    r24" +
      "\n    ldi    r25,1" +
      "\n    cp     r24,r25" +
      "\n    breq     " + body + //" # if true, go to body" +
      "\n    jmp    " + nextBlock +// " # if false, go to next block" +
      "\n" + body + ":" // # while loop body"
    );
    if (node.getStatement() != null) {
      node.getStatement().accept(this);
    }
    write2File(
      "\n    jmp    " + cond +//" # go back to condition" + 
      "\n" + nextBlock + ": "
    );
    outWhileStatement(node);
  }

  @Override
  public void outWhileStatement(WhileStatement node) {
    write2File(
      "\n    ### end of while loop"
    );
  }
}