package ast_visitors;

/** 
 * CheckTypes
 * 
 * This AST visitor traverses a MiniJava Abstract Syntax Tree and checks
 * for a number of type errors.  If a type error is found a SymanticException
 * is thrown
 * 
 * CHANGES to make next year (2012)
 *  - make the error messages between *, +, and - consistent <= ??
 *
 * Bring down the symtab code so that it only does get and set Type
 *  for expressions
 */

import ast.node.*;
import ast.visitor.DepthFirstVisitor;
import java.util.*;

import symtable.SymTable;
import symtable.*;
import exceptions.InternalException;
import exceptions.SemanticException;

public class CheckTypes extends DepthFirstVisitor
{
    
   private SymTable mCurrentST;

   private boolean isByte(Type b) {
      return b == Type.BYTE;
   }

   private boolean isIntOrByte(Type ib) {
      return (ib == Type.INT )|| (ib == Type.BYTE);
   }

   private boolean isBoolean(Type bo) {
      return bo == Type.BOOL;
   }

   private boolean isButton(Type bu) {
      return bu == Type.BUTTON;
   }

   private boolean isVoid(Type v) {
      return v == Type.VOID;
   }

   private boolean isColor(Type c) {
      return c == Type.COLOR;
   }

   private boolean isTone(Type t) {
      return t == Type.TONE;
   }
   
   private Type getType(Node node) {
      if (node == null) return Type.VOID;

      return this.mCurrentST.getExpType(node);
   }

   private void setType(Node node, Type t) {
      this.mCurrentST.setExpType(node, t);
   }

   public CheckTypes(SymTable st) {
     if(st==null) {
          throw new InternalException("unexpected null argument");
      }
      mCurrentST = st;
   }
   
   //========================= Overriding the visitor interface

   public void defaultOut(Node node) {
       //System.err.println("Node not implemented in CheckTypes, " + node.getClass());
   }

   /**
   * =============================
   * ===========fuction===========
   * =============================
   */

   @Override
   public void outMeggyCheckButton(MeggyCheckButton node) {
    if (isButton(getType(node.getExp()))) {
      this.mCurrentST.setExpType(node, Type.BOOL);
    } 
    else {
      throw new SemanticException(
        "Invalid parameter type for Meggy.checkButton, expect: BUTTON", 
        node.getExp().getLine(),
        node.getExp().getPos());
    }
  }
  
  @Override
   public void outMeggyGetPixel(MeggyGetPixel node) {
    Type x = getType(node.getXExp());
    Type y = getType(node.getYExp());
    if (isIntOrByte(x) && isIntOrByte(y)) {
      this.mCurrentST.setExpType(node, Type.COLOR);
    } 
    else {
      throw new SemanticException(
        "Invalid parameter types for Meggy.getPixel, expect: (BYTE, BYTE)",
        node.getXExp().getLine(),
        node.getXExp().getPos());
    }
  }
   
   /**
   * =============================
   * ==========expression=========
   * =============================
   */

   @Override
  public void outIdLiteral(IdLiteral node) {
    VarSTE varSTE = mCurrentST.lookupVar(node.getLexeme());
    if (varSTE != null) {
      this.mCurrentST.setExpType(node, varSTE.getType());
    } 
    else {
      throw new SemanticException(
        "ID [" + node.getLexeme() + "] is not in scope " + mCurrentST.getCurrentScope().getName(), 
        node.getLine(), node.getPos());
    }
  }

  /**
   * =============================
   * ==========statement==========
   * =============================
   */
  @Override
  public void outMeggyDelay(MeggyDelay node) {
    if (isIntOrByte(getType(node.getExp()))) {
      this.mCurrentST.setExpType(node, Type.VOID);
    } else {
      throw new SemanticException(
        "Invalid parameter types for Meggy.delay, expect: INT", 
        node.getLine(), node.getPos());
    }
  }

  @Override
  public void outMeggySetPixel(MeggySetPixel node) {
    Type xExpType = getType(node.getXExp());
    Type yExpType = getType(node.getYExp());
    Type colorType = getType(node.getColor());
    if (isIntOrByte(xExpType) && isIntOrByte(yExpType) && isColor(colorType)) {
          this.mCurrentST.setExpType(node, Type.VOID);
    }
    else {
          throw new SemanticException(
            "Invalid parameter types for Meggy.setPixel, expect: (BYTE, BYTE, COLOR)", 
            node.getLine(), node.getPos());
        }
  }
  
  

  @Override
  public void outMeggyToneStart(MeggyToneStart node) {
    if (!isTone(getType(node.getToneExp()))) {
      throw new SemanticException(
        "Invalid parameter types for Meggy.toneStart, expect: TONE", 
        node.getToneExp().getLine(), node.getToneExp().getPos());
    }
    if (!isIntOrByte(getType(node.getDurationExp()))) {
      throw new SemanticException(
        "Invalid parameter types for Meggy.toneStart, expect: INT", 
        node.getDurationExp().getLine(),
        node.getDurationExp().getPos());
    }
    this.mCurrentST.setExpType(node, Type.VOID);
  }
  
  @Override
  public void visitIfStatement(IfStatement node) {
    inIfStatement(node);
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    if (!isBoolean(getType(node.getExp()))) {
      throw new SemanticException(
        "Invalid condition type for if statement, expect type: BOOL, but output: " + getType(node.getExp()).toString(), 
        node.getLine(), node.getPos());
    }
    if (node.getThenStatement() != null) {
      node.getThenStatement().accept(this);
    }
    if (node.getElseStatement() != null) {
      node.getElseStatement().accept(this);
    }
  }
  
  @Override
  public void visitWhileStatement(WhileStatement node) {
    if (node.getExp() != null) {
      node.getExp().accept(this);
    }
    if (!isBoolean(getType(node.getExp()))) {
      throw new SemanticException(
        "Invalid condition type for while statement, expect type: BOOL, but output: " + getType(node.getExp()).toString(), 
        node.getLine(), node.getPos());
    }
    if (node.getStatement() != null) {
      node.getStatement().accept(this);
    }
  }

  @Override
  public void outAssignStatement(AssignStatement node) {
    VarSTE var = mCurrentST.lookupVar(node.getId());
    if (var != null) {
      if (var.getType() != getType(node.getExp())) {
        throw new SemanticException(
          "Invalid type in assignment to var [" + node.getId() + "], expect: " + var.getType().toString() + ", actual: " + getType(node.getExp()).toString(), 
          node.getLine(), node.getPos());
      }
    } 
    else {
      throw new SemanticException(
        "Var [" + node.getId() + "] is not in scope " + mCurrentST.getCurrentScope().getName(), 
        node.getLine(), node.getPos());
    }
  }


   public void outAndExp(AndExp node)
   {
     if(this.mCurrentST.getExpType(node.getLExp()) != Type.BOOL) {
       throw new SemanticException(
         "Invalid left operand type for operator &&",
         node.getLExp().getLine(), node.getLExp().getPos());
     }

     if(this.mCurrentST.getExpType(node.getRExp()) != Type.BOOL) {
       throw new SemanticException(
         "Invalid right operand type for operator &&",
         node.getRExp().getLine(), node.getRExp().getPos());
     }

     this.mCurrentST.setExpType(node, Type.BOOL);
   }
  
   public void outPlusExp(PlusExp node)
   {
       Type lexpType = this.mCurrentST.getExpType(node.getLExp());
       Type rexpType = this.mCurrentST.getExpType(node.getRExp());
       if ((lexpType==Type.INT  || lexpType==Type.BYTE) &&
           (rexpType==Type.INT  || rexpType==Type.BYTE)
          ){
           this.mCurrentST.setExpType(node, Type.INT);
       } else {
           throw new SemanticException(
                   "Operands to + operator must be INT or BYTE",
                   node.getLExp().getLine(),
                   node.getLExp().getPos());
       }

   }
  

}
