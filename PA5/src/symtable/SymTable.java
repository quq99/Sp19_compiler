package symtable;
import java.util.*;
import ast.node.*;

import exceptions.InternalException;

/** 
 * SymTable
 * ....
 * The symbol table also keeps a mapping of expression nodes to
 * types because that information is needed elsewhere especially
 * when looking up method call information.
 * 
 * @author mstrout
 * WB: Simplified to only expression types
 */
public class SymTable {
    private final HashMap<Node,Type> mExpType = new HashMap<Node,Type>();

    private Scope mGlobalScope;
    private Stack<Scope> mScopeStack;
    public static final int maxParamNum = 12; // 12 formal parameters at most
    public static final String classVarBase = "Z"; // for future use
    public static final String methodVarBase = "Y"; // for future use

    public SymTable() {
        mGlobalScope = new Scope("global", Scope.globalScope); // Global Scope don't need name, maybe?
        mScopeStack = new Stack<>();
        mScopeStack.push(mGlobalScope);
    }
    
    
    public void setExpType(Node exp, Type t)
    {
        if (t == null) {
            System.err.println("Cannot set type to null");
        }
    	this.mExpType.put(exp, t);
    }
    
    public Type getExpType(Node exp)
    {
    	return this.mExpType.get(exp);
    }

    public HashMap<Node, Type> getMap() {
        return mExpType;
    }
   
/*
 */

/**
     * Lookup a symbol in this symbol table.
     * Starts looking in innermost scope and then
     * look in enclosing scopes.
     * Returns null if the symbol is not found.
     */
    public STE lookup (String sym) {
        Stack<Scope> copy = (Stack<Scope>)mScopeStack.clone();
        STE result = null;
        while (!copy.empty()) {
            Scope scope = copy.pop();
            result = scope.lookup(sym);
            if (result != null) {
                return result;
            }
        }
        return null;
    }

    /*public STE lookupOther(String sym, String classScope) {
        Stack<Scope> copy = (Stack<Scope>)mScopeStack.clone();
        STE result = null;
        while (!copy.empty()) {
            Scope scope = copy.pop();
            result = scope.lookup(sym);
            //if (sym.equals("PA4noDef")) 
            //System.out.println(result.getClass().getName());
            //STE STEtest = scope.lookup()
            if (result != null) {
                if ( ("var").equals(classScope) && result instanceof VarSTE) { 
                    System.out.println(result.getClass().getName());
                    return result;
                }
                else if ( ("method").equals(classScope) && result instanceof MethodSTE) { 
                    System.out.println(result.getClass().getName());
                    return result;
                }
                else if ( ("class").equals(classScope) && result instanceof ClassSTE) { 
                    
                    return result;
                }
            }
        }
        return null;
    }*/

    public STE lookupOther(String sym, String typesOfSTE) {
        Stack<Scope> copy = (Stack<Scope>)mScopeStack.clone();
        STE result = null;
        while (!copy.empty()) {
            Scope scope = copy.pop();
            result = scope.lookup(sym);
            if (result != null ) {
                if (typesOfSTE.equals("var") && result instanceof VarSTE) {
                    return result;
                }
                else if (typesOfSTE.equals("method") && result instanceof MethodSTE) {
                    return result;
                }
                else if (typesOfSTE.equals("class") && result instanceof ClassSTE) {
                    return result;
                }
            }
        }
        return null;
    }
    


    /**
     * When inserting an STE will just insert
     * it into the scope at the top of the scope stack.
     */
    public boolean insert(STE ste) {
        Scope currentScope = mScopeStack.peek();
        return currentScope.insert(ste);
    }

    /**
     * Lookup a symbol in innermost scope only.
     * return null if the symbol is not found
     */
    public STE lookupInnermost(String sym) {
        Scope currentScope = mScopeStack.peek();
        return currentScope.lookup(sym);
    }

    public String getInnermostClassName() {
        Stack<Scope> copy = (Stack<Scope>)mScopeStack.clone();
        while (!copy.empty()) {
            Scope currentScope = copy.pop();
            if (currentScope.getScopeType() == Scope.classScope) {
                return currentScope.getName();
            }
        }
        return null;
    }

    /**
     * Lookup the given method scope and make it the innermost
     * scope. That is, make it the top of the scope stack.
     */
    public void pushScope(Scope scope) {
        mScopeStack.push(scope);
    }

    public void popScope() {
        mScopeStack.pop();
    }

    public Scope getCurrentScope() {
        return mScopeStack.peek();
    }

    public Scope getGlobalScope() {
        return mGlobalScope;
    }

    public String genMethodName(String methodName) {
        return mScopeStack.peek().getName() + "_" + methodName;
    }

}
