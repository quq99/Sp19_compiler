package symtable;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;



public class SymTablePrint {
  private SymTable ST;
  private PrintWriter out;
  private int nodeCount;
  private String mainCLassName;
  public SymTablePrint (SymTable ST, PrintWriter out, String mainCLassName) {
    this.ST = ST;
    this.out = out;
    this.mainCLassName = mainCLassName;
  }

  public void printTable() {
    //out.print("hhh");

    visualize(this.ST.getGlobalScope());
  }
  public void visualize(Scope sc) {
    //HashMap<STE, Integer> classRecord = new HashMap<>();
    boolean flag = false; 
    //out.print("hhh");
    //System.out.println("hhh");
    HashMap<String,STE> tempHashMap = new HashMap<String, STE>(sc.getDict()); 
    List<String> keyList = new ArrayList<String>(tempHashMap.keySet()); 
    Collections.sort(keyList);
    //for (String s: keyList) {
    //  System.out.println(s);
    //}

    for (String scopeName : keyList) {
      STE s = tempHashMap.get(scopeName);
      //out.print("hhh");
      if(s instanceof ClassSTE) { 
        if(!flag) {
          out.print("Classes in global scope:");
          flag = true;
        }
        if (!s.getName().equals(mainCLassName)) {
          out.print(" "+ s.getName());
        }
        
      }
    }
    if(flag) {
      out.print("\n");
      flag = false;
    }
    for (String scopeName : keyList) {
      STE s = tempHashMap.get(scopeName);
      if(s instanceof VarSTE) {
        if(!flag) {
          out.print("Vars in current scope:");
          flag = true;
        }
        out.print(" "+((VarSTE)s).getName()+":"+((VarSTE)s).getType());
      }
    }
    if(flag) {
      out.print("\n");
      flag = false;
    }
    for (String scopeName : keyList) {
      STE s = tempHashMap.get(scopeName);
      if(s instanceof MethodSTE) {
        if(!flag) {
          out.print("Methods in current scope:");
          flag = true;
        }
        out.print(" "+s.getName());
      }
    }
    if(flag) {
      out.print("\n");
    }
    for (String scopeName : keyList) {
      STE s = tempHashMap.get(scopeName);
      if(s instanceof ClassSTE) {
        if (!s.getName().equals(mainCLassName)) {
          out.println("\nIn class "+s.getName()+" scope");
          this.visualize(s.getScope());
        }
        
      } 
      else if(s instanceof MethodSTE) {
        out.println("In method "+s.getName()+" scope");
        //print method signature here 
        Signature signature = ((MethodSTE)s).getSignature();
        //List<Type> tempList = signature.getParamTypes();
        //String formals; //add logic to populate formals
        Type retType = signature.getReturnType(); //add logic to populate return type
        
        
        out.println("Method Signature: "+ signature.toString() + " returns "+retType);
        this.visualize(s.getScope());
      }
    }

    out.flush();
  }
}