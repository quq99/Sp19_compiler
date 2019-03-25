package ast_visitors;

import symtable.*;
import java.util.*;
import ast.visitor.*;
import ast.node.*;
import exceptions.InternalException;
import exceptions.SemanticException;

public class BuildSymTable extends DepthFirstVisitor {
  SymTable ST;

  public BuildSymTable() {
    ST = new SymTable();
  }

  public SymTable getSymTable() {
    return ST;
  }

  private void debugInfo(String msg) {
      System.err.println("[Debug Info]: " + msg);
  }

  private Type getType(Node node) {
    if (node == null) {
      return Type.VOID;
    }
    return this.ST.getExpType(node);
  }

  // Literals 
  @Override
  public void outIntType(IntType node) {
    this.ST.setExpType(node, Type.INT);
  }

  @Override
  public void outColorType(ColorType node) {
    this.ST.setExpType(node, Type.COLOR);
  }

  @Override
  public void outButtonType(ButtonType node) {
    this.ST.setExpType(node, Type.BUTTON);
  }

  @Override
  public void outBoolType(BoolType node) {
    this.ST.setExpType(node, Type.BOOL);
  }

  @Override
  public void outByteType(ByteType node) {
    this.ST.setExpType(node, Type.BYTE);
  }

  @Override
  public void outVoidType(VoidType node) {
    this.ST.setExpType(node, Type.VOID);
  }

  @Override
  public void outToneType(ToneType node) {
    this.ST.setExpType(node, Type.TONE);
  }

  @Override
  public void outClassType(ClassType node) {
    this.ST.setExpType(node, Type.getOrCreateType(node.getName()));
  }

  @Override
  public void outIntegerExp(IntLiteral node) {
    this.ST.setExpType(node, Type.INT);
  }

  @Override
  public void outColorExp(ColorLiteral node) {
    this.ST.setExpType(node, Type.COLOR);
  }

  @Override
  public void outButtonExp(ButtonLiteral node) {
    this.ST.setExpType(node, Type.BUTTON);
  }
  
  @Override
  public void outTrueExp(TrueLiteral node) {
    this.ST.setExpType(node, Type.BOOL);
  }

  @Override
  public void outFalseExp(FalseLiteral node) {
    this.ST.setExpType(node, Type.BOOL);
  }

  @Override
  public void outToneExp(ToneLiteral node) {
    this.ST.setExpType(node, Type.TONE);
  }
  
  @Override
  public void outByteCast(ByteCast node) {
    this.ST.setExpType(node, Type.BYTE);
  }
  
  @Override
  public void outLtExp(LtExp node) {
    this.ST.setExpType(node, Type.BOOL);
  }
  
  @Override
  public void outAndExp(AndExp node) {
    this.ST.setExpType(node, Type.BOOL);
  }

  @Override
  public void outThisExp(ThisLiteral node) {
    Type currentType = Type.getOrCreateType(ST.getInnermostClassName());
    this.ST.setExpType(node, currentType);
  }

  @Override
  public void inMainClass(MainClass node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE classSTE = new ClassSTE(node.getName(), 
                                              true,
                                              null, 
                new Scope(node.getName(), Scope.classScope));

    if (!ST.insert(classSTE)) {
      throw new SemanticException("Class [" + classSTE.getName() + "] already defined in current scope", 
        node.getLine(),
        node.getPos());
    }
    String info = "Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName();
    debugInfo(info);
    ST.pushScope(classSTE.getScope());
  }

  @Override
  public void outMainClass(MainClass node) {
    ST.popScope();
  }

  @Override
  public void visitTopClassDecl(TopClassDecl node) {
    assert (ST.getCurrentScope() == ST.getGlobalScope());
    ClassSTE classSTE = new ClassSTE(node.getName(), 
                                      false, 
                                      null, 
                                  new Scope(node.getName(), Scope.classScope));

    if (!ST.insert(classSTE)) {
      throw new SemanticException("Class [" + classSTE.getName() + "] already defined in current scope " + ST.getCurrentScope().getName(),
        node.getLine(), node.getPos());
    }
    String info = "Insert class [" + node.getName() + "] under scope " + ST.getCurrentScope().getName();
    debugInfo(info);
    ST.pushScope(classSTE.getScope());
    
    /* Insert local variables to current scope */
    
    int offset = 0;// offset will be handled in the future
    List<VarDecl> copyV = new ArrayList<VarDecl>(node.getVarDecls());
    for (VarDecl e : copyV) {
      e.accept(this);
      VarSTE varSTE = new VarSTE(e.getName(), 
                                getType(e.getType()), 
                                offset, 
                                SymTable.classVarBase);

      if (classSTE.getScope().insert(varSTE)) {
        String infoo = "Insert var [" + e.getName() + "] under scope " + ST.getCurrentScope().getName();
        debugInfo(infoo);
      } 
      else {
        throw new SemanticException("Var [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
          node.getLine(), node.getPos());
      }
    }
    classSTE.setSize(offset);
  
  
    List<MethodDecl> copyM = new ArrayList<MethodDecl>(node.getMethodDecls());
    for (MethodDecl e : copyM) {
      e.accept(this);
    }
  
    ST.popScope();
  }

  @Override
  public void visitMethodDecl(MethodDecl node) {
    /* Insert MethodSTE */
    String name = node.getName();
    MethodSTE methodSTE = new MethodSTE(name, new Scope(name, Scope.methodScope));
    if (!ST.insert(methodSTE)) {
      throw new SemanticException("Method [" + methodSTE.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
        node.getLine(), node.getPos());
    }
    ST.pushScope(methodSTE.getScope());
    if (node.getType() != null) {
      node.getType().accept(this);
    }    
    /* The true return type depends on the return stmt */
    this.ST.setExpType(node, getType(node.getType()));
    /* Insert the this pointer to current scope */
    int offset = 0;
    VarSTE thisSTE = new VarSTE("THIS", 
                                Type.getOrCreateType(ST.getInnermostClassName()), 
                                offset, 
                                SymTable.methodVarBase);

    methodSTE.getScope().insert(thisSTE);
    /* Insert formal parameters to current scope */
    List<Formal> copyF = new ArrayList<Formal>(node.getFormals());
    for (Formal e : copyF) {
      e.accept(this);
      VarSTE varSTE = new VarSTE(e.getName(), getType(e.getType()), offset, SymTable.methodVarBase);
      if (ST.getCurrentScope().insert(varSTE)) {
        debugInfo("Insert formal [" + e.getName() + "] under scope " + ST.getCurrentScope().getName());
      } 
      else {
        throw new SemanticException("Formal [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
          node.getLine(), node.getPos());
      }
    }
  
    /* Insert local variables to current scope */
    List<VarDecl> copyV = new ArrayList<VarDecl>(node.getVarDecls());
    for (VarDecl e : copyV) {
      e.accept(this);
      VarSTE varSTE = new VarSTE(e.getName(), getType(e.getType()), offset, SymTable.methodVarBase);
      if (methodSTE.getScope().insert(varSTE)) {
        debugInfo("Insert var [" + e.getName() + "] under scope " + ST.getCurrentScope().getName());
      } 
      else {
        throw new SemanticException("Var [" + e.getName() + "] is already defined in scope " + ST.getCurrentScope().getName(), 
          node.getLine(), node.getPos());
      }
    }
  
    /* Traverse statements */
    List<IStatement> copyI = new ArrayList<IStatement>(node.getStatements());
    for (IStatement e : copyI) {
      e.accept(this);
    }
    
    /* The return type */
    if (node.getExp() != null) {
      node.getExp().accept(this);
    } 
    else {
      this.ST.setExpType(node.getExp(), Type.VOID);
    }

    /* Generate function signature */
    Type returnType = getType(node.getType());
    List<Type> mTypeList = new LinkedList<>();
    for (Formal e : node.getFormals()) {
      mTypeList.add(getType(e.getType()));
    }
    Signature mSignature = new Signature(mTypeList, returnType);
    methodSTE.setSignature(mSignature);
    
    if (node.getFormals().size() > SymTable.maxParamNum) {
      throw new SemanticException("Method [" + node.getName() + mSignature.toString() + "] under scope " + ST.getCurrentScope().getName() + " has too many parameters (at most 12)", 
        node.getLine(), node.getPos());
    }
    String info = "Insert method [" + node.getName() + mSignature.toString() + "] under scope " + ST.getCurrentScope().getName();
    debugInfo(info);

    ST.popScope();
  }

  @Override
  public void outNewExp(NewExp node) {
    this.ST.setExpType(node, Type.getOrCreateType(node.getId()));
  }
}
