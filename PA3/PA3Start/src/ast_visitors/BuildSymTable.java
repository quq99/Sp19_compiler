package ast_visitors;

import symtable.*;
import java.util.*;
import ast.visitor.*;
import ast.node.*;
import exceptions.InternalException;
import exceptions.SemanticException;

public class BuildSymTable extends DepthFirstVisitor {
  SymTable ST;
  boolean mDebug;

  public BuildSymTable() {
    ST = new SymTable();
    mDebug = false;
  }

  public BuildSymTable(boolean debug) {
    ST = new SymTable();
    mDebug = debug;
  }

  
}
